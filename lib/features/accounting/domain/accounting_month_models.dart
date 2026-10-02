import '../../../core/money/money.dart';

class AccountingMonthSummary {
  const AccountingMonthSummary({
    required this.monthId,
    required this.mealUnits,
    required this.mealExpense,
    required this.totalExpense,
    required this.deposits,
    required this.activeMemberCount,
  });

  final String monthId;
  final int mealUnits;
  final Money mealExpense;
  final Money totalExpense;
  final Money deposits;
  final int activeMemberCount;

  Money get mealRate => mealUnits == 0
      ? Money.zero
      : Money((mealExpense.minorUnits * 100) ~/ mealUnits);
}
