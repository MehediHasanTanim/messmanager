class AccountingPeriod {
  AccountingPeriod({required this.year, required this.month})
    : assert(year >= 2000),
      assert(month >= 1 && month <= 12);

  final int year;
  final int month;

  DateTime get start => DateTime(year, month);
  DateTime get endExclusive => DateTime(year, month + 1);

  bool contains(DateTime date) {
    return !date.isBefore(start) && date.isBefore(endExclusive);
  }

  @override
  bool operator ==(Object other) =>
      other is AccountingPeriod && other.year == year && other.month == month;

  @override
  int get hashCode => Object.hash(year, month);
}
