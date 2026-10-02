// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import 'expense_models.dart';

class SeedSystemExpenseCategories {
  SeedSystemExpenseCategories(this._database);
  final AppDatabase _database;
  Future<void> call(String messId) async {
    final existing = await _database.expenseDao.categoriesForMess(messId);
    if (existing.isNotEmpty) return;
    for (var index = 0; index < systemExpenseCategorySeeds.length; index++) {
      final seed = systemExpenseCategorySeeds[index];
      await _database.expenseDao.createCategory(
        ExpenseCategoriesCompanion.insert(
          id: 'system-category-$messId-$index',
          messId: messId,
          name: seed.name,
          nameBn: Value(seed.nameBn),
          type: seed.type.databaseValue,
          isSystem: const Value(true),
          sortOrder: Value(index),
        ),
      );
    }
  }
}

class AddExpense {
  AddExpense(this._database);
  final AppDatabase _database;
  Future<void> call({required String id, required ExpenseDraft draft}) =>
      _save(id, draft);
  Future<void> _save(String id, ExpenseDraft draft) async {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
    final category = await _database.expenseDao.categoryById(draft.categoryId);
    if (category == null || category.messId != draft.messId)
      throw ArgumentError('Select a valid category.');
    await _database.expenseDao.saveExpenseForOpenMonth(
      ExpensesCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        date: Value(_day(draft.date)),
        categoryId: Value(draft.categoryId),
        amountMinor: Value(draft.amountMinor),
        description: Value(_nullable(draft.description)),
        vendor: Value(_nullable(draft.vendor)),
        paidByMemberId: Value(_nullable(draft.paidByMemberId)),
        paymentSource: Value(_nullable(draft.paymentSource)),
        affectsMealRate: Value(
          category.type == ExpenseCategoryType.mealExpense.databaseValue,
        ),
        distributionMethod: Value(_nullable(draft.distributionMethod)),
        receiptPath: Value(_nullable(draft.receiptPath)),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

class UpdateExpense extends AddExpense {
  UpdateExpense(super._database);
}

class DeleteExpense {
  DeleteExpense(this._database);
  final AppDatabase _database;
  Future<void> call(String id, String monthId) =>
      _database.expenseDao.deleteExpense(id, monthId);
}

class SearchExpenses {
  SearchExpenses(this._database);
  final AppDatabase _database;
  Future<List<Expense>> call(String monthId, {String query = ''}) =>
      _database.expenseDao.expensesForMonth(monthId, query: query);
}

class GetMealExpenses {
  GetMealExpenses(this._database);
  final AppDatabase _database;
  Future<int> call(String monthId) =>
      _database.expenseDao.mealExpenseTotalForMonth(monthId);
}

class GetMemberPaidExpenses {
  GetMemberPaidExpenses(this._database);
  final AppDatabase _database;
  Future<int> call(String monthId) =>
      _database.expenseDao.memberPaidTotalForMonth(monthId);
}

class GetExpenseSummary {
  GetExpenseSummary(this._database);
  final AppDatabase _database;
  Future<ExpenseSummary> call(String monthId) async {
    final items = await _database.expenseDao.expensesForMonth(monthId);
    final total = items.fold(0, (sum, item) => sum + item.amountMinor);
    final meal = await _database.expenseDao.mealExpenseTotalForMonth(monthId);
    final memberPaid = await _database.expenseDao.memberPaidTotalForMonth(
      monthId,
    );
    return ExpenseSummary(
      totalMinor: total,
      mealExpenseMinor: meal,
      sharedExpenseMinor: total - meal,
      memberPaidMinor: memberPaid,
    );
  }
}

DateTime _day(DateTime date) => DateTime(date.year, date.month, date.day);
String? _nullable(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}
