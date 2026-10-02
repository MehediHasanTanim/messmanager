class Money implements Comparable<Money> {
  const Money(this.minorUnits);

  static const zero = Money(0);

  final int minorUnits;

  Money operator +(Money other) => Money(minorUnits + other.minorUnits);

  Money operator -(Money other) => Money(minorUnits - other.minorUnits);

  Money operator -() => Money(-minorUnits);

  bool get isNegative => minorUnits < 0;
  bool get isZero => minorUnits == 0;
  bool get isPositive => minorUnits > 0;

  String get formattedBdt {
    final absolute = minorUnits.abs();
    final taka = absolute ~/ 100;
    final paisa = absolute % 100;
    final sign = isNegative ? '-' : '';
    return '$sign৳$taka.${paisa.toString().padLeft(2, '0')}';
  }

  @override
  int compareTo(Money other) => minorUnits.compareTo(other.minorUnits);

  @override
  bool operator ==(Object other) =>
      other is Money && other.minorUnits == minorUnits;

  @override
  int get hashCode => minorUnits.hashCode;

  @override
  String toString() => formattedBdt;
}
