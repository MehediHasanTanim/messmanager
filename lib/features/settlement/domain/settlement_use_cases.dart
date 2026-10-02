import '../../../core/database/app_database.dart';
import '../../guest_special/domain/amount_allocator.dart';
import 'settlement_calculator.dart';
import 'settlement_validator.dart';

class DraftSettlement {
  const DraftSettlement({
    required this.input,
    required this.result,
    required this.issues,
  });
  final SettlementInput input;
  final SettlementResult result;
  final List<SettlementIssue> issues;
  bool get canGenerate => !issues.any(
    (issue) => issue.severity == SettlementIssueSeverity.blocking,
  );
}

class GenerateDraftSettlement {
  GenerateDraftSettlement(
    this._database, [
    this._calculator = const SettlementCalculator(),
    this._validator = const SettlementValidator(),
    this._allocator = const AmountAllocator(),
  ]);
  final AppDatabase _database;
  final SettlementCalculator _calculator;
  final SettlementValidator _validator;
  final AmountAllocator _allocator;
  Future<DraftSettlement> call({
    required String messId,
    required String monthId,
  }) async {
    final members = await _database.memberDao
        .watchMembers(messId, status: 'all')
        .first;
    final ids = members.map((member) => member.id).toList();
    final meals = await _database.mealDao.forMonth(monthId);
    final guests = await _database.mealDao.guestMealsForMonth(monthId);
    final specials = await _database.mealDao.specialMealsForMonth(monthId);
    final bills = await _database.utilityDao.billsForMonth(monthId);
    final deposits = await _database.depositDao.depositsForMonth(monthId);
    final adjustments = await _database.adjustmentDao.adjustmentsForMonth(
      monthId,
    );
    final expenses = await _database.expenseDao.expensesForMonth(monthId);
    final mealUnits = _sumBy(
      meals,
      (row) => row.memberId,
      (row) => row.totalUnits,
    );
    for (final guest in guests.where(
      (row) => row.chargeMethod != 'directCharge',
    ))
      mealUnits[guest.hostMemberId] =
          (mealUnits[guest.hostMemberId] ?? 0) + guest.mealUnits;
    final guestCharges = _sumBy(
      guests.where((row) => row.chargeMethod == 'directCharge'),
      (row) => row.hostMemberId,
      (row) => row.directChargeMinor,
    );
    final utilityShares = <String, int>{};
    for (final bill in bills) {
      for (final row in await _database.utilityDao.allocationsForBill(bill.id))
        utilityShares[row.memberId] =
            (utilityShares[row.memberId] ?? 0) + row.amountMinor;
    }
    final specialShares = <String, int>{};
    for (final special in specials) {
      for (final row in await _database.mealDao.specialMealParticipants(
        special.id,
      ))
        specialShares[row.memberId] =
            (specialShares[row.memberId] ?? 0) + row.shareAmountMinor;
    }
    final sharedTotal = expenses
        .where((row) => !row.affectsMealRate)
        .fold(0, (sum, row) => sum + row.amountMinor);
    final sharedShares = sharedTotal == 0 || ids.isEmpty
        ? <String, int>{}
        : _allocator.equal(sharedTotal, ids);
    final input = SettlementInput(
      memberIds: ids,
      mealUnits: mealUnits,
      mealExpenseMinor: expenses
          .where((row) => row.affectsMealRate)
          .fold(0, (sum, row) => sum + row.amountMinor),
      guestCharges: guestCharges,
      specialMealShares: specialShares,
      specialMealTotalMinor: specials.fold(
        0,
        (sum, row) => sum + row.totalCostMinor,
      ),
      utilityShares: utilityShares,
      utilityTotalMinor: bills.fold(0, (sum, row) => sum + row.amountMinor),
      sharedExpenseShares: sharedShares,
      sharedExpenseTotalMinor: sharedTotal,
      deposits: _sumBy(
        deposits,
        (row) => row.memberId,
        (row) => row.amountMinor,
      ),
      memberPaidExpenses: _sumBy(
        expenses.where((row) => row.paidByMemberId != null),
        (row) => row.paidByMemberId!,
        (row) => row.amountMinor,
      ),
      debitAdjustments: _sumBy(
        adjustments.where((row) => row.direction == 'debit'),
        (row) => row.memberId,
        (row) => row.amountMinor,
      ),
      creditAdjustments: _sumBy(
        adjustments.where((row) => row.direction == 'credit'),
        (row) => row.memberId,
        (row) => row.amountMinor,
      ),
      previousBalances: {
        for (final member in members) member.id: member.openingBalanceMinor,
      },
    );
    final result = _calculator.calculate(input);
    return DraftSettlement(
      input: input,
      result: result,
      issues: _validator.validate(input, result),
    );
  }
}

Map<String, int> _sumBy<T>(
  Iterable<T> values,
  String Function(T) id,
  int Function(T) amount,
) {
  final result = <String, int>{};
  for (final value in values)
    result[id(value)] = (result[id(value)] ?? 0) + amount(value);
  return result;
}
