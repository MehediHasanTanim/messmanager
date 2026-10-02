import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/features/accounting/domain/accounting_engine.dart';

void main() {
  group('MealRateCalculator', () {
    const calculator = MealRateCalculator();
    test('handles zero meals and zero expense without division', () {
      final result = calculator.calculate(
        mealExpenseMinor: 0,
        mealUnitsScaled: 0,
      );
      expect(result.internalRateScaled, 0);
      expect(result.displayTakaPerMeal, 0);
    });
    test('retains precision for half meals and reconciles rounded shares', () {
      final result = calculator.calculate(
        mealExpenseMinor: 100,
        mealUnitsScaled: 150,
      );
      expect(result.internalRateScaled, 666666);
      final shares = calculator.allocateMealCosts(
        mealExpenseMinor: 100,
        memberUnits: {'b': 50, 'a': 100},
      );
      expect(shares, {'a': 67, 'b': 33});
      expect(shares.values.reduce((a, b) => a + b), 100);
    });
    test('one member receives the full original expense', () {
      expect(
        calculator.allocateMealCosts(
          mealExpenseMinor: 999,
          memberUnits: {'member': 50},
        ),
        {'member': 999},
      );
    });
  });

  group('MemberBalanceCalculator', () {
    const calculator = MemberBalanceCalculator();
    test('includes every payable and credit component exactly once', () {
      final result = calculator.calculate(
        const MemberBalanceInput(
          mealCostMinor: 100,
          guestChargeMinor: 20,
          specialMealMinor: 30,
          utilityMinor: 40,
          sharedExpenseMinor: 50,
          debitAdjustmentMinor: 60,
          previousDueMinor: 70,
          depositsMinor: 80,
          memberPaidExpenseMinor: 90,
          creditAdjustmentMinor: 10,
          previousCreditMinor: 5,
        ),
      );
      expect(result.totalPayableMinor, 370);
      expect(result.totalCreditMinor, 185);
      expect(result.finalBalanceMinor, -185);
    });
    test(
      'over deposit and previous credit preserve a positive member credit',
      () {
        final result = calculator.calculate(
          const MemberBalanceInput(
            mealCostMinor: 100,
            depositsMinor: 150,
            previousCreditMinor: 25,
          ),
        );
        expect(result.finalBalanceMinor, 75);
      },
    );
    test('under deposit and previous due preserve a member due', () {
      final result = calculator.calculate(
        const MemberBalanceInput(
          mealCostMinor: 100,
          previousDueMinor: 20,
          depositsMinor: 50,
        ),
      );
      expect(result.finalBalanceMinor, -70);
    });
  });
}
