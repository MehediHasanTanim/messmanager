import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/finance/domain/finance_models.dart';
import 'package:mess_manager_bd/features/finance/domain/finance_use_cases.dart';

void main() {
  group('utilities, deposits and adjustments', () {
    late AppDatabase database;
    setUp(() async {
      database = AppDatabase.forTesting(NativeDatabase.memory());
      await database.messDao.create(
        MessesCompanion.insert(
          id: 'mess',
          name: 'Test',
          managerName: 'Manager',
        ),
      );
      await database.accountingMonthDao.create(
        AccountingMonthsCompanion.insert(
          id: 'month',
          messId: 'mess',
          year: 2026,
          month: 10,
          startDate: DateTime(2026, 10, 1),
        ),
      );
      for (final id in ['a', 'b', 'c']) {
        await database.memberDao.create(
          MembersCompanion.insert(
            id: id,
            messId: 'mess',
            name: id,
            joinDate: DateTime(2026, 10, 1),
          ),
        );
      }
    });
    tearDown(() => database.close());

    test('equal utility allocation is a reconciled snapshot with deterministic remainder', () async {
      await AddUtilityBill(database)(
        id: 'water',
        draft: _utility(100),
        activeMemberIds: ['c', 'a', 'b'],
      );
      final rows = await database.utilityDao.allocationsForBill('water');
      expect(rows.fold(0, (sum, row) => sum + row.amountMinor), 100);
      expect(rows.firstWhere((row) => row.memberId == 'a').amountMinor, 34);
      expect(rows.firstWhere((row) => row.memberId == 'b').amountMinor, 33);
    });

    test('selected utility allocation excludes non-selected members', () async {
      await AddUtilityBill(database)(
        id: 'gas',
        draft: _utility(
          101,
          distribution: UtilityDistribution.selectedMembers,
          ids: ['a', 'c'],
        ),
        activeMemberIds: ['a', 'b', 'c'],
      );
      final rows = await database.utilityDao.allocationsForBill('gas');
      expect(rows.map((row) => row.memberId), unorderedEquals(['a', 'c']));
      expect(rows.fold(0, (sum, row) => sum + row.amountMinor), 101);
    });

    test('deposit CRUD and adjustment directions persist', () async {
      final deposit = DepositDraft(
        messId: 'mess',
        accountingMonthId: 'month',
        memberId: 'a',
        date: DateTime(2026, 10, 2),
        amountMinor: 5000,
        method: DepositMethod.bkash,
      );
      await AddDeposit(database)(id: 'deposit', draft: deposit);
      await UpdateDeposit(database)(
        id: 'deposit',
        draft: DepositDraft(
          messId: 'mess',
          accountingMonthId: 'month',
          memberId: 'a',
          date: DateTime(2026, 10, 2),
          amountMinor: 7500,
          method: DepositMethod.cash,
        ),
      );
      expect(
        (await GetMemberDeposits(database)('a', 'month')).single.amountMinor,
        7500,
      );
      await DeleteDeposit(database)('deposit', 'month');
      expect(await GetMemberDeposits(database)('a', 'month'), isEmpty);
      await AddAdjustment(database)(
        id: 'debit',
        draft: _adjustment(AdjustmentDirection.debit),
      );
      await AddAdjustment(database)(
        id: 'credit',
        draft: _adjustment(AdjustmentDirection.credit),
      );
      expect(
        (await database.adjustmentDao.adjustmentsForMonth('month'))
            .map((a) => a.direction),
        containsAll(['debit', 'credit']),
      );
    });

    test('closed accounting month rejects all finance mutations', () async {
      await (database.update(database.accountingMonths)
            ..where((m) => m.id.equals('month')))
          .write(const AccountingMonthsCompanion(status: Value('closed')));
      await expectLater(
        AddDeposit(database)(
          id: 'blocked',
          draft: DepositDraft(
            messId: 'mess',
            accountingMonthId: 'month',
            memberId: 'a',
            date: DateTime.now(),
            amountMinor: 100,
            method: DepositMethod.cash,
          ),
        ),
        throwsStateError,
      );
      await expectLater(
        AddAdjustment(database)(
          id: 'blocked',
          draft: _adjustment(AdjustmentDirection.debit),
        ),
        throwsStateError,
      );
      await expectLater(
        AddUtilityBill(database)(
          id: 'blocked',
          draft: _utility(100),
          activeMemberIds: ['a'],
        ),
        throwsStateError,
      );
    });
  });
}

UtilityBillDraft _utility(
  int amount, {
  UtilityDistribution distribution = UtilityDistribution.allActive,
  List<String> ids = const [],
}) => UtilityBillDraft(
  messId: 'mess',
  accountingMonthId: 'month',
  billType: 'Water',
  amountMinor: amount,
  billingMonth: DateTime(2026, 10),
  distribution: distribution,
  memberIds: ids,
);
AdjustmentDraft _adjustment(AdjustmentDirection direction) => AdjustmentDraft(
  messId: 'mess',
  accountingMonthId: 'month',
  memberId: 'a',
  date: DateTime(2026, 10, 2),
  amountMinor: 100,
  direction: direction,
  reason: 'Correction',
);
