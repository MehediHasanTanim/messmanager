import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/settlement/domain/closing_use_cases.dart';

void main() {
  late AppDatabase database;
  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.messDao.create(
      MessesCompanion.insert(id: 'mess', name: 'Test', managerName: 'Manager'),
    );
    await _month(database, 'october', 10);
    await database.memberDao.create(
      MembersCompanion.insert(
        id: 'member',
        messId: 'mess',
        name: 'Member',
        joinDate: DateTime(2026, 10, 1),
      ),
    );
    await database.mealDao.saveEntry(
      MealEntriesCompanion.insert(
        id: 'meal',
        messId: 'mess',
        accountingMonthId: 'october',
        memberId: 'member',
        mealDate: DateTime(2026, 10, 1),
        totalUnits: const Value(100),
      ),
    );
  });
  tearDown(() => database.close());

  test(
    'close is atomic and stores an immutable-shaped settlement snapshot',
    () async {
      await CloseAccountingMonth(database)(messId: 'mess', monthId: 'october');
      final month = await _monthById(database, 'october');
      final settlement = await database.settlementDao.forMonth('october');
      expect(month.status, 'closed');
      expect(month.finalMealRateScaled, isNotNull);
      expect(settlement, isNotNull);
      final rows = await (database.select(
        database.memberSettlements,
      )..where((row) => row.settlementId.equals(settlement!.id))).get();
      expect(rows, hasLength(1));
      expect(rows.single.memberId, 'member');
    },
  );

  test('failed validation rolls back without a close or snapshot', () async {
    await database.utilityDao.createBillWithAllocations(
      UtilityBillsCompanion.insert(
        id: 'bad-utility',
        messId: 'mess',
        accountingMonthId: 'october',
        billType: 'Water',
        amountMinor: 100,
        billingMonth: DateTime(2026, 10),
        distributionMethod: 'allActive',
      ),
      [],
    );
    await expectLater(
      CloseAccountingMonth(database)(messId: 'mess', monthId: 'october'),
      throwsStateError,
    );
    expect((await _monthById(database, 'october')).status, 'active');
    expect(await database.settlementDao.forMonth('october'), isNull);
  });

  test(
    'reopen preserves audit, permits recalculation and supports reclose',
    () async {
      await CloseAccountingMonth(database)(messId: 'mess', monthId: 'october');
      await ReopenAccountingMonth(database)(
        messId: 'mess',
        monthId: 'october',
        authenticated: true,
      );
      expect((await _monthById(database, 'october')).status, 'active');
      final audit = await (database.select(
        database.auditEntries,
      )..where((row) => row.entityId.equals('october'))).get();
      expect(audit.map((row) => row.action), contains('reopened'));
      await CloseAccountingMonth(database)(messId: 'mess', monthId: 'october');
      expect((await _monthById(database, 'october')).status, 'closed');
    },
  );

  test(
    'carry-forward creates debit/credit records only for selected balances',
    () async {
      await _month(database, 'november', 11);
      await CarryForwardBalances(database)(
        messId: 'mess',
        nextMonthId: 'november',
        selectedBalances: {'member': 500},
      );
      final rows = await database.adjustmentDao.adjustmentsForMonth('november');
      expect(rows.single.direction, 'credit');
      expect(rows.single.amountMinor, 500);
    },
  );
}

Future<void> _month(AppDatabase db, String id, int month) =>
    db.accountingMonthDao.create(
      AccountingMonthsCompanion.insert(
        id: id,
        messId: 'mess',
        year: 2026,
        month: month,
        startDate: DateTime(2026, month, 1),
      ),
    );
Future<AccountingMonth> _monthById(AppDatabase db, String id) => (db.select(
  db.accountingMonths,
)..where((row) => row.id.equals(id))).getSingle();
