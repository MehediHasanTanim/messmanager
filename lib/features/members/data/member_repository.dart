import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/member_models.dart';

class DriftMemberRepository {
  DriftMemberRepository(this._database);

  final AppDatabase _database;

  Stream<List<Member>> watchActiveMembers(String messId) =>
      _database.memberDao.watchActiveMembers(messId);

  Stream<List<Member>> searchMembers(
    String messId, {
    MemberStatus? status,
    String query = '',
  }) => _database.memberDao.watchMembers(
    messId,
    status: status?.databaseValue ?? 'all',
    query: query,
  );

  Future<Member?> findById(String id) => _database.memberDao.findById(id);

  Future<void> add(String id, MemberDraft draft) async {
    _validate(draft);
    await _database.memberDao.create(_companion(id, draft));
  }

  Future<void> update(String id, MemberDraft draft) async {
    _validate(draft);
    final existing = await findById(id);
    if (existing == null) throw StateError('Member not found.');
    await _database.memberDao.updateMember(
      _companion(id, draft, createdAt: existing.createdAt),
    );
  }

  Future<void> changeStatus(
    String memberId,
    MemberStatus status, {
    DateTime? leaveDate,
  }) async {
    final member = await findById(memberId);
    if (member == null) throw StateError('Member not found.');
    if (status == MemberStatus.left) {
      if (leaveDate == null || leaveDate.isBefore(member.joinDate)) {
        throw ArgumentError('Leave date must be on or after join date.');
      }
    }
    // This only changes the membership record. No transaction rows are
    // deleted, so statements and already-closed settlements stay intact.
    await _database.memberDao.changeStatus(
      memberId,
      status: status.databaseValue,
      leaveDate: status == MemberStatus.active ? null : leaveDate,
    );
  }

  Stream<List<MealEntry>> watchMeals(String memberId, String monthId) =>
      _database.memberDao.watchMeals(memberId, monthId);
  Stream<List<Deposit>> watchDeposits(String memberId, String monthId) =>
      _database.memberDao.watchDeposits(memberId, monthId);
  Stream<List<Expense>> watchExpensesPaid(String memberId, String monthId) =>
      _database.memberDao.watchExpensesPaid(memberId, monthId);
  Stream<List<MemberAdjustment>> watchAdjustments(
    String memberId,
    String monthId,
  ) => _database.memberDao.watchAdjustments(memberId, monthId);
  Future<List<MemberMonthlyHistory>> monthlyHistory(String memberId) async {
    final rows = await _database.memberDao.monthlyHistory(memberId);
    return rows
        .map((row) {
          final month = row.readTable(_database.accountingMonths);
          final settlement = row.readTable(_database.memberSettlements);
          return MemberMonthlyHistory(
            monthStart: month.startDate,
            mealUnits: settlement.mealUnits,
            finalBalanceMinor: settlement.finalBalanceMinor,
          );
        })
        .toList(growable: false);
  }

  MembersCompanion _companion(
    String id,
    MemberDraft draft, {
    DateTime? createdAt,
  }) => MembersCompanion(
    id: Value(id),
    messId: Value(draft.messId),
    name: Value(draft.name.trim()),
    nickname: Value(_nullable(draft.nickname)),
    phone: Value(_nullable(draft.phone)),
    roomNumber: Value(_nullable(draft.roomNumber)),
    avatarPath: Value(_nullable(draft.avatarPath)),
    joinDate: Value(_dateOnly(draft.joinDate)),
    leaveDate: Value(
      draft.leaveDate == null ? null : _dateOnly(draft.leaveDate!),
    ),
    openingBalanceMinor: Value(draft.openingBalanceMinor),
    status: Value(draft.status.databaseValue),
    notes: Value(_nullable(draft.notes)),
    createdAt: Value(createdAt ?? DateTime.now()),
    updatedAt: Value(DateTime.now()),
  );

  void _validate(MemberDraft draft) {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
  }
}

String? _nullable(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);
