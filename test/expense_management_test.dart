import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/expenses/domain/expense_models.dart';
import 'package:mess_manager_bd/features/expenses/domain/expense_use_cases.dart';

void main() {
  late AppDatabase database;
  late List<ExpenseCategory> categories;
  late ExpenseCategory Function(ExpenseCategoryType) category;
  late Future<void> Function(
    String,
    String,
    int, {
    String? payer,
    String? description,
  })
  addExpense;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.messDao.create(
      MessesCompanion.insert(id: 'mess', name: 'Test', managerName: 'Manager'),
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
    await database.memberDao.create(
      MembersCompanion.insert(
        id: 'member',
        messId: 'mess',
        name: 'Rahim',
        joinDate: DateTime(2026, 10, 1),
      ),
    );
    await SeedSystemExpenseCategories(database)('mess');
    categories = await database.expenseDao.categoriesForMess('mess');
    category = (type) =>
        categories.firstWhere((item) => item.type == type.databaseValue);
    addExpense = (id, categoryId, amount, {payer, description}) =>
        AddExpense(database)(
          id: id,
          draft: ExpenseDraft(
            messId: 'mess',
            accountingMonthId: 'month',
            date: DateTime(2026, 10, 2),
            categoryId: categoryId,
            amountMinor: amount,
            paidByMemberId: payer,
            description: description,
          ),
        );
  });
  tearDown(() => database.close());

  test('seeds system categories once and supports custom categories', () async {
    expect(categories, hasLength(14));
    await SeedSystemExpenseCategories(database)('mess');
    expect(await database.expenseDao.categoriesForMess('mess'), hasLength(14));
    await database.expenseDao.saveCategory(
      ExpenseCategoriesCompanion.insert(
        id: 'custom',
        messId: 'mess',
        name: 'Snacks',
        type: 'mealExpense',
      ),
    );
    expect(
      (await database.expenseDao.categoriesForMess('mess'))
          .map((item) => item.name),
      contains('Snacks'),
    );
  });

  test(
    'includes meal expenses and excludes shared expenses from meal rate',
    () async {
      await addExpense(
        'meal',
        category(ExpenseCategoryType.mealExpense).id,
        10000,
      );
      await addExpense(
        'shared',
        category(ExpenseCategoryType.sharedExpense).id,
        5000,
      );
      expect(await GetMealExpenses(database)('month'), 10000);
      final summary = await GetExpenseSummary(database)('month');
      expect(summary.totalMinor, 15000);
      expect(summary.sharedExpenseMinor, 5000);
    },
  );

  test('records a member-paid expense without creating a deposit', () async {
    await addExpense(
      'paid',
      category(ExpenseCategoryType.mealExpense).id,
      7000,
      payer: 'member',
    );
    expect(await GetMemberPaidExpenses(database)('month'), 7000);
    expect(
      await database.depositDao.totalForMemberInMonth('member', 'month'),
      0,
    );
  });

  test('searches expenses and rejects closed-month writes', () async {
    await addExpense(
      'rice',
      category(ExpenseCategoryType.mealExpense).id,
      1000,
      description: 'Rice market',
    );
    expect(
      await SearchExpenses(database)('month', query: 'rice'),
      hasLength(1),
    );
    await (database.update(database.accountingMonths)
          ..where((table) => table.id.equals('month')))
        .write(const AccountingMonthsCompanion(status: Value('closed')));
    await expectLater(
      addExpense('closed', category(ExpenseCategoryType.mealExpense).id, 1000),
      throwsStateError,
    );
  });
}
