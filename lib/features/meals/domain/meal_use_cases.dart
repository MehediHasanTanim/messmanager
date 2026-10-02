import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/money/meal_units.dart';
import 'meal_models.dart';

class GetMealsForDate {
  GetMealsForDate(this._database);
  final AppDatabase _database;

  Future<DailyMealSheet> call({
    required String messId,
    required DateTime date,
  }) async {
    final normalizedDate = _day(date);
    final members = await _database.mealDao.eligibleMembersForDate(
      messId,
      normalizedDate,
    );
    final entries = await _database.mealDao.forDate(messId, normalizedDate);
    return DailyMealSheet(
      date: normalizedDate,
      members: members,
      entries: {for (final entry in entries) entry.memberId: entry},
    );
  }
}

class RecordDailyMeals {
  RecordDailyMeals(this._database);
  final AppDatabase _database;

  Future<void> call({
    required String messId,
    required String accountingMonthId,
    required DateTime date,
    required MealEntryMode mode,
    required List<DailyMealDraft> entries,
  }) async {
    final normalizedDate = _day(date);
    final companions = <MealEntriesCompanion>[];
    for (final draft in entries) {
      final error = draft.validate(mode);
      if (error != null) throw ArgumentError(error);
      final isTotal = mode == MealEntryMode.total;
      companions.add(
        MealEntriesCompanion.insert(
          id:
              draft.id ??
              _entryId(accountingMonthId, draft.memberId, normalizedDate),
          messId: messId,
          accountingMonthId: accountingMonthId,
          memberId: draft.memberId,
          mealDate: normalizedDate,
          breakfastUnits: Value(isTotal ? 0 : draft.breakfastUnits),
          lunchUnits: Value(isTotal ? 0 : draft.lunchUnits),
          dinnerUnits: Value(isTotal ? 0 : draft.dinnerUnits),
          extraUnits: Value(isTotal ? 0 : draft.extraUnits),
          totalUnits: Value(draft.totalFor(mode)),
          notes: Value(_nullable(draft.notes)),
        ),
      );
    }
    await _database.mealDao.saveDailyEntriesForOpenMonth(
      accountingMonthId,
      companions,
    );
  }
}

class UpdateDailyMeals extends RecordDailyMeals {
  UpdateDailyMeals(super._database);
}

class CopyPreviousDayMeals {
  CopyPreviousDayMeals(this._database);
  final AppDatabase _database;

  Future<List<DailyMealDraft>> call({
    required String messId,
    required DateTime date,
    required List<Member> eligibleMembers,
  }) async {
    final previous = await _database.mealDao.forDate(
      messId,
      _day(date).subtract(const Duration(days: 1)),
    );
    final byMember = {for (final entry in previous) entry.memberId: entry};
    return [
      for (final member in eligibleMembers)
        byMember.containsKey(member.id)
            ? DailyMealDraft.fromEntry(byMember[member.id]!)
            : DailyMealDraft(memberId: member.id),
    ];
  }
}

class GetMealCalendar {
  GetMealCalendar(this._database);
  final AppDatabase _database;

  Future<List<MealCalendarDay>> call(String accountingMonthId) async {
    final entries = await _database.mealDao.forMonth(accountingMonthId);
    final grouped = <DateTime, List<MealEntry>>{};
    for (final entry in entries) {
      grouped.putIfAbsent(_day(entry.mealDate), () => []).add(entry);
    }
    return grouped.entries
        .map(
          (item) => MealCalendarDay(
            date: item.key,
            totalUnits: item.value.fold(
              0,
              (sum, entry) => sum + entry.totalUnits,
            ),
            enteredMembers: item.value.length,
          ),
        )
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }
}

class GetMemberMealHistory {
  GetMemberMealHistory(this._database);
  final AppDatabase _database;
  Stream<List<MealEntry>> call(String memberId, String monthId) =>
      _database.memberDao.watchMeals(memberId, monthId);
}

class CalculateDailyMealTotal {
  MealUnits call(Iterable<DailyMealDraft> entries, MealEntryMode mode) =>
      MealUnits(entries.fold(0, (sum, entry) => sum + entry.totalFor(mode)));
}

DateTime _day(DateTime date) => DateTime(date.year, date.month, date.day);
String? _nullable(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

String _entryId(String monthId, String memberId, DateTime date) =>
    'meal-$monthId-$memberId-${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
