/// Deterministic financial calculation rules.
///
/// Monetary values remain in integer minor units. Meal units are scaled by 100;
/// rates are stored as minor-units per scaled unit multiplied by 1,000,000.
/// No intermediate value is rounded. A display rate is rounded only for text,
/// and per-member meal costs receive any remainder in stable member-id order.
class MealRateCalculator {
  static const precision = 1000000;

  const MealRateCalculator();

  MealRateResult calculate({
    required int mealExpenseMinor,
    required int mealUnitsScaled,
  }) {
    if (mealExpenseMinor < 0 || mealUnitsScaled < 0)
      throw ArgumentError('Totals cannot be negative.');
    if (mealUnitsScaled == 0) return MealRateResult.zero(mealExpenseMinor);
    return MealRateResult(
      mealExpenseMinor: mealExpenseMinor,
      mealUnitsScaled: mealUnitsScaled,
      internalRateScaled: (mealExpenseMinor * precision) ~/ mealUnitsScaled,
      unallocatedRateRemainder:
          (mealExpenseMinor * precision) % mealUnitsScaled,
    );
  }

  /// Allocates the original expense amount directly, rather than rounded rate
  /// products. This guarantees the allocation always reconciles exactly.
  Map<String, int> allocateMealCosts({
    required int mealExpenseMinor,
    required Map<String, int> memberUnits,
  }) {
    final ids = memberUnits.keys.toList()..sort();
    final total = memberUnits.values.fold(0, (sum, units) => sum + units);
    if (total == 0 || mealExpenseMinor == 0)
      return {for (final id in ids) id: 0};
    final base = <String, int>{};
    var allocated = 0;
    for (final id in ids) {
      final amount = (mealExpenseMinor * memberUnits[id]!) ~/ total;
      base[id] = amount;
      allocated += amount;
    }
    for (var index = 0; index < mealExpenseMinor - allocated; index++)
      base[ids[index % ids.length]] = base[ids[index % ids.length]]! + 1;
    return base;
  }
}

class MealRateResult {
  const MealRateResult({
    required this.mealExpenseMinor,
    required this.mealUnitsScaled,
    required this.internalRateScaled,
    required this.unallocatedRateRemainder,
  });
  factory MealRateResult.zero(int expense) => MealRateResult(
    mealExpenseMinor: expense,
    mealUnitsScaled: 0,
    internalRateScaled: 0,
    unallocatedRateRemainder: 0,
  );
  final int mealExpenseMinor,
      mealUnitsScaled,
      internalRateScaled,
      unallocatedRateRemainder;
  double get displayTakaPerMeal => mealUnitsScaled == 0
      ? 0
      : mealExpenseMinor / 100 / (mealUnitsScaled / 100);
}

class MemberBalanceInput {
  const MemberBalanceInput({
    this.mealCostMinor = 0,
    this.guestChargeMinor = 0,
    this.specialMealMinor = 0,
    this.utilityMinor = 0,
    this.sharedExpenseMinor = 0,
    this.debitAdjustmentMinor = 0,
    this.previousDueMinor = 0,
    this.depositsMinor = 0,
    this.memberPaidExpenseMinor = 0,
    this.creditAdjustmentMinor = 0,
    this.previousCreditMinor = 0,
  });
  final int mealCostMinor,
      guestChargeMinor,
      specialMealMinor,
      utilityMinor,
      sharedExpenseMinor,
      debitAdjustmentMinor,
      previousDueMinor,
      depositsMinor,
      memberPaidExpenseMinor,
      creditAdjustmentMinor,
      previousCreditMinor;
}

class MemberBalanceCalculator {
  const MemberBalanceCalculator();
  MemberBalanceResult calculate(MemberBalanceInput input) {
    final payable =
        input.mealCostMinor +
        input.guestChargeMinor +
        input.specialMealMinor +
        input.utilityMinor +
        input.sharedExpenseMinor +
        input.debitAdjustmentMinor +
        input.previousDueMinor;
    final credit =
        input.depositsMinor +
        input.memberPaidExpenseMinor +
        input.creditAdjustmentMinor +
        input.previousCreditMinor;
    return MemberBalanceResult(
      totalPayableMinor: payable,
      totalCreditMinor: credit,
      finalBalanceMinor: credit - payable,
    );
  }
}

class MemberBalanceResult {
  const MemberBalanceResult({
    required this.totalPayableMinor,
    required this.totalCreditMinor,
    required this.finalBalanceMinor,
  });
  final int totalPayableMinor, totalCreditMinor, finalBalanceMinor;
}
