import 'settlement_calculator.dart';

enum SettlementIssueSeverity { blocking, warning }

class SettlementIssue {
  const SettlementIssue(this.severity, this.message);
  final SettlementIssueSeverity severity;
  final String message;
}

class SettlementValidator {
  const SettlementValidator();
  List<SettlementIssue> validate(
    SettlementInput input,
    SettlementResult result,
  ) {
    final issues = <SettlementIssue>[];
    final ids = input.memberIds.toSet();
    final maps = [
      input.mealUnits,
      input.guestCharges,
      input.specialMealShares,
      input.utilityShares,
      input.sharedExpenseShares,
      input.deposits,
      input.memberPaidExpenses,
      input.debitAdjustments,
      input.creditAdjustments,
      input.previousBalances,
    ];
    if (ids.length != input.memberIds.length)
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.blocking,
          'Duplicate member reference.',
        ),
      );
    if (maps.any(
      (map) =>
          map.keys.any((id) => !ids.contains(id)) ||
          map.values.any((value) => value < 0),
    ))
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.blocking,
          'Broken member reference or invalid financial record.',
        ),
      );
    if (!result.reconciliation.isReconciled)
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.blocking,
          'Allocation mismatch.',
        ),
      );
    if (result.members.any(
      (row) => row.totalPayableMinor < 0 || row.totalCreditMinor < 0,
    ))
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.blocking,
          'Calculation mismatch.',
        ),
      );
    if (result.totalMealsScaled == 0)
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.warning,
          'Zero meals recorded.',
        ),
      );
    if (input.deposits.values.fold(0, (sum, value) => sum + value) == 0)
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.warning,
          'Zero deposit recorded.',
        ),
      );
    if (maps.any((map) => map.values.any((value) => value > 100000000)))
      issues.add(
        const SettlementIssue(
          SettlementIssueSeverity.warning,
          'Unusually high amount.',
        ),
      );
    return issues;
  }
}
