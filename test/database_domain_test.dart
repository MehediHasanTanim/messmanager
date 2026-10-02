import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/core/money/accounting_period.dart';
import 'package:mess_manager_bd/core/money/meal_units.dart';
import 'package:mess_manager_bd/core/money/member_balance.dart';
import 'package:mess_manager_bd/core/money/money.dart';

void main() {
  group('Money', () {
    test('uses integer minor units for exact arithmetic', () {
      const groceries = Money(587200);
      const deposit = Money(700000);

      expect(groceries + deposit, const Money(1287200));
      expect(deposit - groceries, const Money(112800));
      expect(const Money(-6974).formattedBdt, '-৳69.74');
    });
  });

  group('MealUnits', () {
    test('adds scaled whole and half meals without floating point', () {
      expect(MealUnits.one + MealUnits.half, const MealUnits(150));
      expect(const MealUnits(150).display, '1.5');
      expect(() => MealUnits.half - MealUnits.one, throwsStateError);
    });
  });

  test(
    'AccountingPeriod and MemberBalance communicate financial direction',
    () {
      final period = AccountingPeriod(year: 2025, month: 8);
      const balance = MemberBalance(
        totalPayable: Money(632000),
        totalCredit: Money(700000),
      );

      expect(period.contains(DateTime(2025, 8, 31, 23, 59)), isTrue);
      expect(period.contains(DateTime(2025, 9)), isFalse);
      expect(balance.finalBalance, const Money(68000));
      expect(balance.direction, MemberBalanceDirection.messOwesMember);
    },
  );

  group('AppDatabase v1', () {
    late AppDatabase database;

    setUp(() {
      database = AppDatabase.forTesting(NativeDatabase.memory());
    });

    tearDown(() => database.close());

    test('creates the complete v1 schema and required indexes', () async {
      final tables = await database
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type = 'table' ORDER BY name",
          )
          .get();
      final indexes = await database
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type = 'index' ORDER BY name",
          )
          .get();

      final tableNames = tables.map((row) => row.read<String>('name')).toSet();
      final indexNames = indexes.map((row) => row.read<String>('name')).toSet();

      expect(tableNames, containsAll(_expectedTableNames));
      expect(indexNames, contains('idx_meal_entries_member_date'));
      expect(indexNames, contains('idx_expenses_month'));
      expect(indexNames, contains('idx_deposits_member_date'));
    });

    test('enforces foreign keys and unique accounting months', () async {
      await _createMess(database);
      await _createMonth(database);

      await expectLater(
        database.memberDao.create(
          MembersCompanion.insert(
            id: 'orphan-member',
            messId: 'missing-mess',
            name: 'Orphan',
            joinDate: DateTime(2025, 8, 1),
          ),
        ),
        throwsA(anything),
      );

      await expectLater(
        database.accountingMonthDao.create(
          AccountingMonthsCompanion.insert(
            id: 'month-duplicate',
            messId: 'mess-1',
            year: 2025,
            month: 8,
            startDate: DateTime(2025, 8, 1),
          ),
        ),
        throwsA(anything),
      );
    });

    test('supports DAO CRUD and aggregate queries', () async {
      await _createMess(database);
      await _createMonth(database);
      await _createMember(database);
      await _createExpenseCategory(database);

      await database.expenseDao.createExpense(
        ExpensesCompanion.insert(
          id: 'expense-1',
          messId: 'mess-1',
          accountingMonthId: 'month-1',
          date: DateTime(2025, 8, 5),
          categoryId: 'category-1',
          amountMinor: 185000,
          affectsMealRate: const Value(true),
        ),
      );
      await database.expenseDao.createExpense(
        ExpensesCompanion.insert(
          id: 'expense-2',
          messId: 'mess-1',
          accountingMonthId: 'month-1',
          date: DateTime(2025, 8, 6),
          categoryId: 'category-1',
          amountMinor: 120000,
        ),
      );

      final member = await database.memberDao.findById('member-1');

      expect(member?.name, 'Rahim');
      expect(await database.expenseDao.totalForMonth('month-1'), 305000);
      expect(
        await database.expenseDao.mealExpenseTotalForMonth('month-1'),
        185000,
      );
      await database.memberDao.updateMember(
        member!.copyWith(name: 'Karim').toCompanion(true),
      );
      expect((await database.memberDao.findById('member-1'))?.name, 'Karim');
      expect(await database.memberDao.deleteById('member-1'), 1);
      expect(await database.memberDao.findById('member-1'), isNull);
    });

    test('rejects negative meal units and non-positive expenses', () async {
      await _createMess(database);
      await _createMonth(database);
      await _createMember(database);
      await _createExpenseCategory(database);

      await expectLater(
        database
            .into(database.mealEntries)
            .insert(
              MealEntriesCompanion.insert(
                id: 'negative-meal',
                messId: 'mess-1',
                accountingMonthId: 'month-1',
                memberId: 'member-1',
                mealDate: DateTime(2025, 8, 5),
                totalUnits: const Value(-1),
              ),
            ),
        throwsA(anything),
      );
      await expectLater(
        database.expenseDao.createExpense(
          ExpensesCompanion.insert(
            id: 'zero-expense',
            messId: 'mess-1',
            accountingMonthId: 'month-1',
            date: DateTime(2025, 8, 5),
            categoryId: 'category-1',
            amountMinor: 0,
          ),
        ),
        throwsA(anything),
      );
    });

    test('enforces one meal entry per member per mess and day', () async {
      await _createMess(database);
      await _createMonth(database);
      await _createMember(database);
      final date = DateTime(2025, 8, 5);

      await database
          .into(database.mealEntries)
          .insert(
            MealEntriesCompanion.insert(
              id: 'meal-1',
              messId: 'mess-1',
              accountingMonthId: 'month-1',
              memberId: 'member-1',
              mealDate: date,
              totalUnits: const Value(300),
            ),
          );

      await expectLater(
        database
            .into(database.mealEntries)
            .insert(
              MealEntriesCompanion.insert(
                id: 'meal-2',
                messId: 'mess-1',
                accountingMonthId: 'month-1',
                memberId: 'member-1',
                mealDate: date,
                totalUnits: const Value(200),
              ),
            ),
        throwsA(anything),
      );
    });

    test(
      'rolls back a daily meal transaction when one row is invalid',
      () async {
        await _createMess(database);
        await _createMonth(database);
        await _createMember(database);
        final date = DateTime(2025, 8, 10);

        await expectLater(
          database.mealDao.saveDailyEntries([
            MealEntriesCompanion.insert(
              id: 'transaction-valid',
              messId: 'mess-1',
              accountingMonthId: 'month-1',
              memberId: 'member-1',
              mealDate: date,
              totalUnits: const Value(300),
            ),
            MealEntriesCompanion.insert(
              id: 'transaction-invalid',
              messId: 'mess-1',
              accountingMonthId: 'month-1',
              memberId: 'missing-member',
              mealDate: date,
              totalUnits: const Value(100),
            ),
          ]),
          throwsA(anything),
        );

        final saved = await (database.select(
          database.mealEntries,
        )..where((table) => table.id.equals('transaction-valid'))).get();
        expect(saved, isEmpty);
      },
    );
  });
}

const _expectedTableNames = {
  'accounting_months',
  'app_settings',
  'attachments',
  'audit_entries',
  'backup_metadata',
  'deposits',
  'expense_categories',
  'expenses',
  'guest_meals',
  'meal_entries',
  'member_adjustments',
  'member_settlements',
  'members',
  'messes',
  'reminders',
  'settlements',
  'special_meal_members',
  'special_meals',
  'utility_bill_allocations',
  'utility_bills',
};

Future<void> _createMess(AppDatabase database) {
  return database.messDao.create(
    MessesCompanion.insert(
      id: 'mess-1',
      name: 'Green View',
      managerName: 'Tanim',
    ),
  );
}

Future<void> _createMonth(AppDatabase database) {
  return database.accountingMonthDao.create(
    AccountingMonthsCompanion.insert(
      id: 'month-1',
      messId: 'mess-1',
      year: 2025,
      month: 8,
      startDate: DateTime(2025, 8, 1),
    ),
  );
}

Future<void> _createMember(AppDatabase database) {
  return database.memberDao.create(
    MembersCompanion.insert(
      id: 'member-1',
      messId: 'mess-1',
      name: 'Rahim',
      joinDate: DateTime(2025, 8, 1),
    ),
  );
}

Future<void> _createExpenseCategory(AppDatabase database) {
  return database.expenseDao.createCategory(
    ExpenseCategoriesCompanion.insert(
      id: 'category-1',
      messId: 'mess-1',
      name: 'Vegetables',
      type: 'mealExpense',
    ),
  );
}
