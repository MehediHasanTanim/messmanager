import '../../../core/database/app_database.dart';
import 'accounting_engine.dart';

class DashboardSummary {
  const DashboardSummary({
    required this.activeMembers,
    required this.todayUnits,
    required this.monthUnits,
    required this.mealExpenseMinor,
    required this.depositMinor,
    required this.utilityMinor,
    required this.rate,
  });
  final int activeMembers,
      todayUnits,
      monthUnits,
      mealExpenseMinor,
      depositMinor,
      utilityMinor;
  final MealRateResult rate;
}

class GetDashboardSummary {
  GetDashboardSummary(this._database);
  final AppDatabase _database;
  Future<DashboardSummary> call({
    required String messId,
    required String monthId,
    DateTime? today,
  }) async {
    final date = today ?? DateTime.now();
    final active = await _database.memberDao.activeCount(messId);
    final todayUnits = await _database.mealDao.totalUnitsForDate(messId, date);
    final monthUnits = await _database.mealDao.totalUnitsForMonth(monthId);
    final mealExpense = await _database.expenseDao.mealExpenseTotalForMonth(
      monthId,
    );
    final deposits = await _database.depositDao.totalForMonth(monthId);
    final utilities = await _database.utilityDao.totalForMonth(monthId);
    return DashboardSummary(
      activeMembers: active,
      todayUnits: todayUnits,
      monthUnits: monthUnits,
      mealExpenseMinor: mealExpense,
      depositMinor: deposits,
      utilityMinor: utilities,
      rate: const MealRateCalculator().calculate(
        mealExpenseMinor: mealExpense,
        mealUnitsScaled: monthUnits,
      ),
    );
  }
}
