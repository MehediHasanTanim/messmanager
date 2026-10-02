import '../../../core/database/app_database.dart';
import '../../../core/money/meal_units.dart';

enum MealEntryMode { separate, total }

class DailyMealDraft {
  const DailyMealDraft({
    required this.memberId,
    this.id,
    this.breakfastUnits = 0,
    this.lunchUnits = 0,
    this.dinnerUnits = 0,
    this.extraUnits = 0,
    this.totalUnits,
    this.notes,
  });

  final String memberId;
  final String? id;
  final int breakfastUnits;
  final int lunchUnits;
  final int dinnerUnits;
  final int extraUnits;
  final int? totalUnits;
  final String? notes;

  int totalFor(MealEntryMode mode) => mode == MealEntryMode.total
      ? totalUnits ?? 0
      : breakfastUnits + lunchUnits + dinnerUnits + extraUnits;

  String? validate(MealEntryMode mode) {
    final values = [
      breakfastUnits,
      lunchUnits,
      dinnerUnits,
      extraUnits,
      totalFor(mode),
    ];
    if (values.any(
      (value) => value < 0 || value % MealUnits.half.scaledUnits != 0,
    )) {
      return 'Meals must be in 0.5-unit increments.';
    }
    if (mode == MealEntryMode.total &&
        [
          breakfastUnits,
          lunchUnits,
          dinnerUnits,
          extraUnits,
        ].any((value) => value != 0)) {
      return 'A total-units entry cannot also contain separate meal types.';
    }
    return null;
  }

  DailyMealDraft copyWith({
    int? breakfastUnits,
    int? lunchUnits,
    int? dinnerUnits,
    int? extraUnits,
    int? totalUnits,
    bool clearTotal = false,
  }) => DailyMealDraft(
    id: id,
    memberId: memberId,
    breakfastUnits: breakfastUnits ?? this.breakfastUnits,
    lunchUnits: lunchUnits ?? this.lunchUnits,
    dinnerUnits: dinnerUnits ?? this.dinnerUnits,
    extraUnits: extraUnits ?? this.extraUnits,
    totalUnits: clearTotal ? null : totalUnits ?? this.totalUnits,
    notes: notes,
  );

  factory DailyMealDraft.fromEntry(MealEntry entry) => DailyMealDraft(
    id: entry.id,
    memberId: entry.memberId,
    breakfastUnits: entry.breakfastUnits,
    lunchUnits: entry.lunchUnits,
    dinnerUnits: entry.dinnerUnits,
    extraUnits: entry.extraUnits,
    totalUnits: entry.totalUnits,
    notes: entry.notes,
  );
}

class DailyMealSheet {
  const DailyMealSheet({
    required this.date,
    required this.members,
    required this.entries,
  });

  final DateTime date;
  final List<Member> members;
  final Map<String, MealEntry> entries;
}

class MealCalendarDay {
  const MealCalendarDay({
    required this.date,
    required this.totalUnits,
    required this.enteredMembers,
  });
  final DateTime date;
  final int totalUnits;
  final int enteredMembers;
}
