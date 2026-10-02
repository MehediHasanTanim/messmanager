import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/features/settlement/domain/settlement_calculator.dart';
import 'package:mess_manager_bd/features/settlement/domain/settlement_validator.dart';

void main() {
  const calculator = SettlementCalculator();
  const validator = SettlementValidator();
  test(
    'draft settlement reconciles meal, utility, special and shared totals',
    () {
      final result = calculator.calculate(
        const SettlementInput(
          memberIds: ['b', 'a'],
          mealUnits: {'a': 100, 'b': 50},
          mealExpenseMinor: 100,
          guestCharges: {'b': 20},
          specialMealShares: {'a': 30, 'b': 30},
          specialMealTotalMinor: 60,
          utilityShares: {'a': 51, 'b': 50},
          utilityTotalMinor: 101,
          sharedExpenseShares: {'a': 10, 'b': 10},
          sharedExpenseTotalMinor: 20,
          deposits: {'a': 50},
          memberPaidExpenses: {'b': 25},
          debitAdjustments: {'a': 5},
          creditAdjustments: {'b': 3},
          previousBalances: {'a': -10, 'b': 7},
        ),
      );
      expect(result.totalMealsScaled, 150);
      expect(result.reconciliation.isReconciled, isTrue);
      expect(
        result.members.firstWhere((row) => row.memberId == 'a').mealCostMinor,
        67,
      );
      expect(
        result.members.firstWhere((row) => row.memberId == 'b').mealCostMinor,
        33,
      );
      expect(
        validator
            .validate(
              const SettlementInput(
                memberIds: ['b', 'a'],
                mealUnits: {'a': 100, 'b': 50},
                mealExpenseMinor: 100,
                utilityShares: {'a': 51, 'b': 50},
                utilityTotalMinor: 101,
                specialMealShares: {'a': 30, 'b': 30},
                specialMealTotalMinor: 60,
                sharedExpenseShares: {'a': 10, 'b': 10},
                sharedExpenseTotalMinor: 20,
              ),
              result,
            )
            .where(
              (issue) => issue.severity == SettlementIssueSeverity.blocking,
            ),
        isEmpty,
      );
    },
  );
  test('validator blocks allocation and broken-reference errors, but warns on no activity', () {
    final input = const SettlementInput(
      memberIds: ['a'],
      mealUnits: {'other': 1},
      mealExpenseMinor: 0,
      utilityShares: {'a': 5},
      utilityTotalMinor: 4,
    );
    final issues = validator.validate(input, calculator.calculate(input));
    expect(
      issues.where(
        (issue) => issue.severity == SettlementIssueSeverity.blocking,
      ),
      isNotEmpty,
    );
    expect(
      issues
          .where((issue) => issue.severity == SettlementIssueSeverity.warning)
          .map((issue) => issue.message),
      contains('Zero meals recorded.'),
    );
  });
}
