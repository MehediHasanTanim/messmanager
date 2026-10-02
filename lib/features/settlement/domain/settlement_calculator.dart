import '../../accounting/domain/accounting_engine.dart';

/// Pure settlement input. Amounts are integer minor units; meal units are
/// scaled by 100. Each map is an already-recorded allocation snapshot.
class SettlementInput {
  const SettlementInput({
    required this.memberIds,
    required this.mealUnits,
    required this.mealExpenseMinor,
    this.guestCharges = const {},
    this.specialMealShares = const {},
    this.utilityShares = const {},
    this.sharedExpenseShares = const {},
    this.deposits = const {},
    this.memberPaidExpenses = const {},
    this.debitAdjustments = const {},
    this.creditAdjustments = const {},
    this.previousBalances = const {},
    this.utilityTotalMinor = 0,
    this.specialMealTotalMinor = 0,
    this.sharedExpenseTotalMinor = 0,
  });
  final List<String> memberIds;
  final Map<String, int> mealUnits,
      guestCharges,
      specialMealShares,
      utilityShares,
      sharedExpenseShares,
      deposits,
      memberPaidExpenses,
      debitAdjustments,
      creditAdjustments,
      previousBalances;
  final int mealExpenseMinor,
      utilityTotalMinor,
      specialMealTotalMinor,
      sharedExpenseTotalMinor;
}

class SettlementCalculator {
  const SettlementCalculator([
    this._rateCalculator = const MealRateCalculator(),
    this._balanceCalculator = const MemberBalanceCalculator(),
  ]);
  final MealRateCalculator _rateCalculator;
  final MemberBalanceCalculator _balanceCalculator;

  SettlementResult calculate(SettlementInput input) {
    final ids = input.memberIds.toSet().toList()..sort();
    final units = {for (final id in ids) id: input.mealUnits[id] ?? 0};
    final rate = _rateCalculator.calculate(
      mealExpenseMinor: input.mealExpenseMinor,
      mealUnitsScaled: units.values.fold(0, (sum, value) => sum + value),
    );
    final mealCosts = _rateCalculator.allocateMealCosts(
      mealExpenseMinor: input.mealExpenseMinor,
      memberUnits: units,
    );
    final rows = <SettlementMemberResult>[];
    for (final id in ids) {
      final previous = input.previousBalances[id] ?? 0;
      final balance = _balanceCalculator.calculate(
        MemberBalanceInput(
          mealCostMinor: mealCosts[id] ?? 0,
          guestChargeMinor: input.guestCharges[id] ?? 0,
          specialMealMinor: input.specialMealShares[id] ?? 0,
          utilityMinor: input.utilityShares[id] ?? 0,
          sharedExpenseMinor: input.sharedExpenseShares[id] ?? 0,
          debitAdjustmentMinor: input.debitAdjustments[id] ?? 0,
          previousDueMinor: previous < 0 ? -previous : 0,
          depositsMinor: input.deposits[id] ?? 0,
          memberPaidExpenseMinor: input.memberPaidExpenses[id] ?? 0,
          creditAdjustmentMinor: input.creditAdjustments[id] ?? 0,
          previousCreditMinor: previous > 0 ? previous : 0,
        ),
      );
      rows.add(
        SettlementMemberResult(
          memberId: id,
          mealUnitsScaled: units[id]!,
          mealCostMinor: mealCosts[id]!,
          guestChargeMinor: input.guestCharges[id] ?? 0,
          specialMealMinor: input.specialMealShares[id] ?? 0,
          utilityMinor: input.utilityShares[id] ?? 0,
          sharedExpenseMinor: input.sharedExpenseShares[id] ?? 0,
          debitAdjustmentMinor: input.debitAdjustments[id] ?? 0,
          creditAdjustmentMinor: input.creditAdjustments[id] ?? 0,
          depositsMinor: input.deposits[id] ?? 0,
          memberPaidExpenseMinor: input.memberPaidExpenses[id] ?? 0,
          previousBalanceMinor: previous,
          totalPayableMinor: balance.totalPayableMinor,
          totalCreditMinor: balance.totalCreditMinor,
          finalBalanceMinor: balance.finalBalanceMinor,
        ),
      );
    }
    return SettlementResult(
      rate: rate,
      members: rows,
      reconciliation: SettlementReconciliation(
        mealExpenseMinor: input.mealExpenseMinor,
        allocatedMealCostMinor: mealCosts.values.fold(
          0,
          (sum, value) => sum + value,
        ),
        utilityTotalMinor: input.utilityTotalMinor,
        allocatedUtilityMinor: input.utilityShares.values.fold(
          0,
          (sum, value) => sum + value,
        ),
        specialMealTotalMinor: input.specialMealTotalMinor,
        allocatedSpecialMealMinor: input.specialMealShares.values.fold(
          0,
          (sum, value) => sum + value,
        ),
        sharedExpenseTotalMinor: input.sharedExpenseTotalMinor,
        allocatedSharedExpenseMinor: input.sharedExpenseShares.values.fold(
          0,
          (sum, value) => sum + value,
        ),
      ),
    );
  }
}

class SettlementMemberResult {
  const SettlementMemberResult({
    required this.memberId,
    required this.mealUnitsScaled,
    required this.mealCostMinor,
    required this.guestChargeMinor,
    required this.specialMealMinor,
    required this.utilityMinor,
    required this.sharedExpenseMinor,
    required this.debitAdjustmentMinor,
    required this.creditAdjustmentMinor,
    required this.depositsMinor,
    required this.memberPaidExpenseMinor,
    required this.previousBalanceMinor,
    required this.totalPayableMinor,
    required this.totalCreditMinor,
    required this.finalBalanceMinor,
  });
  final String memberId;
  final int mealUnitsScaled,
      mealCostMinor,
      guestChargeMinor,
      specialMealMinor,
      utilityMinor,
      sharedExpenseMinor,
      debitAdjustmentMinor,
      creditAdjustmentMinor,
      depositsMinor,
      memberPaidExpenseMinor,
      previousBalanceMinor,
      totalPayableMinor,
      totalCreditMinor,
      finalBalanceMinor;
}

class SettlementResult {
  const SettlementResult({
    required this.rate,
    required this.members,
    required this.reconciliation,
  });
  final MealRateResult rate;
  final List<SettlementMemberResult> members;
  final SettlementReconciliation reconciliation;
  int get totalMealsScaled =>
      members.fold(0, (sum, row) => sum + row.mealUnitsScaled);
}

class SettlementReconciliation {
  const SettlementReconciliation({
    required this.mealExpenseMinor,
    required this.allocatedMealCostMinor,
    required this.utilityTotalMinor,
    required this.allocatedUtilityMinor,
    required this.specialMealTotalMinor,
    required this.allocatedSpecialMealMinor,
    required this.sharedExpenseTotalMinor,
    required this.allocatedSharedExpenseMinor,
  });
  final int mealExpenseMinor,
      allocatedMealCostMinor,
      utilityTotalMinor,
      allocatedUtilityMinor,
      specialMealTotalMinor,
      allocatedSpecialMealMinor,
      sharedExpenseTotalMinor,
      allocatedSharedExpenseMinor;
  bool get isReconciled =>
      mealExpenseMinor == allocatedMealCostMinor &&
      utilityTotalMinor == allocatedUtilityMinor &&
      specialMealTotalMinor == allocatedSpecialMealMinor &&
      sharedExpenseTotalMinor == allocatedSharedExpenseMinor;
}
