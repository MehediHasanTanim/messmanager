class MealUnits implements Comparable<MealUnits> {
  const MealUnits(this.scaledUnits) : assert(scaledUnits >= 0);

  static const scale = 100;
  static const zero = MealUnits(0);
  static const half = MealUnits(50);
  static const one = MealUnits(scale);

  final int scaledUnits;

  MealUnits operator +(MealUnits other) =>
      MealUnits(scaledUnits + other.scaledUnits);

  MealUnits operator -(MealUnits other) {
    final result = scaledUnits - other.scaledUnits;
    if (result < 0) {
      throw StateError('Meal units cannot be negative.');
    }
    return MealUnits(result);
  }

  String get display {
    if (scaledUnits % scale == 0) {
      return '${scaledUnits ~/ scale}';
    }
    return (scaledUnits / scale)
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0$'), '');
  }

  @override
  int compareTo(MealUnits other) => scaledUnits.compareTo(other.scaledUnits);

  @override
  bool operator ==(Object other) =>
      other is MealUnits && other.scaledUnits == scaledUnits;

  @override
  int get hashCode => scaledUnits.hashCode;
}
