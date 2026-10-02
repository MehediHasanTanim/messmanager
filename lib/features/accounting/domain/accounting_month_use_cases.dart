import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/money/money.dart';
import 'accounting_month_models.dart';

class GetCurrentAccountingMonth {
  GetCurrentAccountingMonth(this._database);
  final AppDatabase _database;

  Future<AccountingMonth?> call(String messId) =>
      _database.accountingMonthDao.unclosedForMess(messId);
}

class ListAccountingMonths {
  ListAccountingMonths(this._database);
  final AppDatabase _database;

  Stream<List<AccountingMonth>> call(String messId) =>
      _database.accountingMonthDao.watchForMess(messId);
}

class StartAccountingMonth {
  StartAccountingMonth(this._database);
  final AppDatabase _database;

  /// A new month can only be started after the active month is closed. This
  /// protects the single-current-period invariant at the business layer as
  /// well as the UI.
  Future<void> call({
    required String id,
    required String messId,
    required DateTime startDate,
  }) async {
    final date = DateTime(startDate.year, startDate.month, 1);
    if (date.year < 2000) throw ArgumentError('Invalid accounting month.');
    final current = await _database.accountingMonthDao.unclosedForMess(messId);
    if (current != null) {
      throw StateError(
        'Close the current accounting month before starting another.',
      );
    }
    await _database.accountingMonthDao.create(
      AccountingMonthsCompanion.insert(
        id: id,
        messId: messId,
        year: date.year,
        month: date.month,
        startDate: date,
      ),
    );
  }
}

class GetAccountingMonthSummary {
  GetAccountingMonthSummary(this._database);
  final AppDatabase _database;

  Future<AccountingMonthSummary> call({
    required String messId,
    required String monthId,
  }) async {
    final results = await Future.wait<int>([
      _database.mealDao.totalUnitsForMonth(monthId),
      _database.expenseDao.mealExpenseTotalForMonth(monthId),
      _database.expenseDao.totalForMonth(monthId),
      _totalDeposits(monthId),
      _activeMemberCount(messId),
    ]);
    return AccountingMonthSummary(
      monthId: monthId,
      mealUnits: results[0],
      mealExpense: Money(results[1]),
      totalExpense: Money(results[2]),
      deposits: Money(results[3]),
      activeMemberCount: results[4],
    );
  }

  Future<int> _totalDeposits(String monthId) async {
    final sum = _database.deposits.amountMinor.sum();
    final query = _database.selectOnly(_database.deposits)
      ..addColumns([sum])
      ..where(_database.deposits.accountingMonthId.equals(monthId));
    return (await query.getSingle()).read(sum) ?? 0;
  }

  Future<int> _activeMemberCount(String messId) async {
    final count = _database.members.id.count();
    final query = _database.selectOnly(_database.members)
      ..addColumns([count])
      ..where(
        _database.members.messId.equals(messId) &
            _database.members.status.equals('active'),
      );
    return (await query.getSingle()).read(count) ?? 0;
  }
}
