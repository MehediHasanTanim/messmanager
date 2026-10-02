import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../guest_special/domain/amount_allocator.dart';
import 'finance_models.dart';

class AllocateUtilityBill {
  const AllocateUtilityBill([this._allocator = const AmountAllocator()]);
  final AmountAllocator _allocator;
  Map<String, int> call(
    UtilityBillDraft draft, {
    required Iterable<String> activeMemberIds,
  }) {
    final ids = draft.distribution == UtilityDistribution.allActive
        ? activeMemberIds
        : draft.memberIds;
    return switch (draft.distribution) {
      UtilityDistribution.allActive || UtilityDistribution.selectedMembers =>
        _allocator.equal(draft.amountMinor, ids),
      UtilityDistribution.custom => _allocator.custom(
        amountMinor: draft.amountMinor,
        participantIds: ids,
        allocations: draft.customAllocations,
      ),
    };
  }
}

class AddUtilityBill {
  AddUtilityBill(
    this._database, [
    this._allocate = const AllocateUtilityBill(),
  ]);
  final AppDatabase _database;
  final AllocateUtilityBill _allocate;
  Future<void> call({
    required String id,
    required UtilityBillDraft draft,
    required Iterable<String> activeMemberIds,
  }) => _save(id: id, draft: draft, activeMemberIds: activeMemberIds);
  Future<void> _save({
    required String id,
    required UtilityBillDraft draft,
    required Iterable<String> activeMemberIds,
  }) async {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
    final shares = _allocate(draft, activeMemberIds: activeMemberIds);
    await _database.utilityDao.saveBillForOpenMonth(
      UtilityBillsCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        billType: Value(draft.billType.trim()),
        amountMinor: Value(draft.amountMinor),
        billingMonth: Value(_day(draft.billingMonth)),
        dueDate: Value(draft.dueDate),
        distributionMethod: Value(draft.distribution.databaseValue),
        receiptPath: Value(_nullable(draft.receiptPath)),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
      [
        for (final entry in shares.entries)
          UtilityBillAllocationsCompanion.insert(
            id: '$id-${entry.key}',
            utilityBillId: id,
            memberId: entry.key,
            amountMinor: entry.value,
          ),
      ],
    );
  }
}

class UpdateUtilityBill extends AddUtilityBill {
  UpdateUtilityBill(super._database, [super._allocate]);
}

class MarkBillPaid {
  MarkBillPaid(this._database);
  final AppDatabase _database;
  Future<void> call(
    String id,
    String monthId, {
    String? paidByMemberId,
    DateTime? paidDate,
  }) => _database.utilityDao.markPaid(
    id,
    monthId,
    paidByMemberId: paidByMemberId,
    paidDate: paidDate,
  );
}

class GetUtilitySummary {
  GetUtilitySummary(this._database);
  final AppDatabase _database;
  Future<UtilitySummary> call(String monthId) async {
    final bills = await _database.utilityDao.billsForMonth(monthId);
    final paid = bills
        .where((b) => b.status == 'paid')
        .fold(0, (s, b) => s + b.amountMinor);
    final total = bills.fold(0, (s, b) => s + b.amountMinor);
    return UtilitySummary(
      totalMinor: total,
      paidMinor: paid,
      unpaidMinor: total - paid,
    );
  }
}

class AddDeposit {
  AddDeposit(this._database);
  final AppDatabase _database;
  Future<void> call({required String id, required DepositDraft draft}) =>
      _save(id, draft);
  Future<void> _save(String id, DepositDraft draft) async {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
    await _database.depositDao.saveForOpenMonth(
      DepositsCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        memberId: Value(draft.memberId),
        date: Value(_day(draft.date)),
        amountMinor: Value(draft.amountMinor),
        paymentMethod: Value(draft.method.databaseValue),
        reference: Value(_nullable(draft.reference)),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

class UpdateDeposit extends AddDeposit {
  UpdateDeposit(super._database);
}

class DeleteDeposit {
  DeleteDeposit(this._database);
  final AppDatabase _database;
  Future<void> call(String id, String monthId) =>
      _database.depositDao.deleteForOpenMonth(id, monthId);
}

class GetMemberDeposits {
  GetMemberDeposits(this._database);
  final AppDatabase _database;
  Future<List<Deposit>> call(String memberId, String monthId) =>
      _database.depositDao.depositsForMember(memberId, monthId);
}

class GetMonthlyDepositSummary {
  GetMonthlyDepositSummary(this._database);
  final AppDatabase _database;
  Future<DepositSummary> call(String monthId) async {
    final rows = await _database.depositDao.depositsForMonth(monthId);
    return DepositSummary(
      totalMinor: rows.fold(0, (s, row) => s + row.amountMinor),
      count: rows.length,
    );
  }
}

class AddAdjustment {
  AddAdjustment(this._database);
  final AppDatabase _database;
  Future<void> call({required String id, required AdjustmentDraft draft}) =>
      _save(id, draft);
  Future<void> _save(String id, AdjustmentDraft draft) async {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
    await _database.adjustmentDao.saveForOpenMonth(
      MemberAdjustmentsCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        memberId: Value(draft.memberId),
        date: Value(_day(draft.date)),
        type: Value(draft.type),
        direction: Value(draft.direction.name),
        amountMinor: Value(draft.amountMinor),
        reason: Value(draft.reason.trim()),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

class UpdateAdjustment extends AddAdjustment {
  UpdateAdjustment(super._database);
}

class DeleteAdjustment {
  DeleteAdjustment(this._database);
  final AppDatabase _database;
  Future<void> call(String id, String monthId) =>
      _database.adjustmentDao.deleteForOpenMonth(id, monthId);
}

DateTime _day(DateTime date) => DateTime(date.year, date.month, date.day);
String? _nullable(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}
