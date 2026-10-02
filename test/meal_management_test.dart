import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/core/money/meal_units.dart';
import 'package:mess_manager_bd/features/meals/domain/meal_models.dart';
import 'package:mess_manager_bd/features/meals/domain/meal_use_cases.dart';

void main() {
  late AppDatabase database;
  late DateTime date;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    date = DateTime(2026, 10, 10);
    await database.messDao.create(
      MessesCompanion.insert(
        id: 'mess',
        name: 'Test mess',
        managerName: 'Manager',
      ),
    );
    await database.accountingMonthDao.create(
      AccountingMonthsCompanion.insert(
        id: 'month',
        messId: 'mess',
        year: 2026,
        month: 10,
        startDate: DateTime(2026, 10, 1),
      ),
    );
    await _member(
      database,
      id: 'active',
      name: 'Active',
      joinDate: DateTime(2026, 10, 1),
    );
  });

  tearDown(() => database.close());

  test('accepts zero, half, and custom meals as scaled units', () async {
    final calculator = CalculateDailyMealTotal();
    final total = calculator([
      const DailyMealDraft(memberId: 'zero'),
      const DailyMealDraft(memberId: 'half', breakfastUnits: 50),
      const DailyMealDraft(memberId: 'custom', lunchUnits: 250),
    ], MealEntryMode.separate);

    expect(total, const MealUnits(300));
    await _member(
      database,
      id: 'zero',
      name: 'Zero',
      joinDate: DateTime(2026, 10, 1),
    );
    await _record(database, [
      const DailyMealDraft(memberId: 'zero'),
      const DailyMealDraft(
        memberId: 'active',
        breakfastUnits: 50,
        lunchUnits: 250,
      ),
    ]);
    final entries = await database.mealDao.forDate('mess', date);
    expect(entries.map((entry) => entry.totalUnits), containsAll([0, 300]));
  });

  test(
    'copies yesterday only for members eligible on the selected date',
    () async {
      await _record(database, [
        const DailyMealDraft(
          memberId: 'active',
          breakfastUnits: 100,
          dinnerUnits: 50,
        ),
      ], date: date.subtract(const Duration(days: 1)));
      await _member(database, id: 'joined-today', name: 'New', joinDate: date);

      final sheet = await GetMealsForDate(database)(messId: 'mess', date: date);
      final copied = await CopyPreviousDayMeals(database)(
        messId: 'mess',
        date: date,
        eligibleMembers: sheet.members,
      );

      expect(copied, hasLength(2));
      expect(
        copied
            .firstWhere((item) => item.memberId == 'active')
            .totalFor(MealEntryMode.separate),
        150,
      );
      expect(
        copied
            .firstWhere((item) => item.memberId == 'joined-today')
            .totalFor(MealEntryMode.separate),
        0,
      );
    },
  );

  test(
    'excludes inactive and not-yet-joined members from daily sheets',
    () async {
      await _member(
        database,
        id: 'inactive',
        name: 'Inactive',
        joinDate: DateTime(2026, 10, 1),
        status: 'inactive',
      );
      await _member(
        database,
        id: 'future',
        name: 'Future',
        joinDate: DateTime(2026, 10, 11),
      );

      final sheet = await GetMealsForDate(database)(messId: 'mess', date: date);
      expect(sheet.members.map((member) => member.id), ['active']);
    },
  );

  test('historical edits update the stable daily record', () async {
    await _record(database, [
      const DailyMealDraft(memberId: 'active', totalUnits: 100),
    ], mode: MealEntryMode.total);
    final original = (await database.mealDao.forDate('mess', date)).single;
    await _record(database, [
      DailyMealDraft(id: original.id, memberId: 'active', totalUnits: 150),
    ], mode: MealEntryMode.total);

    final rows = await database.mealDao.forDate('mess', date);
    expect(rows, hasLength(1));
    expect(rows.single.totalUnits, 150);
  });

  test('rolls back the whole daily sheet when any entry is invalid', () async {
    await expectLater(
      _record(database, [
        const DailyMealDraft(memberId: 'active', totalUnits: 100),
        const DailyMealDraft(memberId: 'missing', totalUnits: 100),
      ], mode: MealEntryMode.total),
      throwsA(anything),
    );
    expect(await database.mealDao.forDate('mess', date), isEmpty);
  });

  test('rejects meal writes for closed accounting months', () async {
    await (database.update(database.accountingMonths)
          ..where((table) => table.id.equals('month')))
        .write(const AccountingMonthsCompanion(status: Value('closed')));
    await expectLater(
      _record(database, [
        const DailyMealDraft(memberId: 'active', totalUnits: 100),
      ], mode: MealEntryMode.total),
      throwsStateError,
    );
  });
}

Future<void> _record(
  AppDatabase database,
  List<DailyMealDraft> entries, {
  DateTime? date,
  MealEntryMode mode = MealEntryMode.separate,
}) => RecordDailyMeals(database)(
  messId: 'mess',
  accountingMonthId: 'month',
  date: date ?? DateTime(2026, 10, 10),
  mode: mode,
  entries: entries,
);

Future<void> _member(
  AppDatabase database, {
  required String id,
  required String name,
  required DateTime joinDate,
  String status = 'active',
}) => database.memberDao.create(
  MembersCompanion.insert(
    id: id,
    messId: 'mess',
    name: name,
    joinDate: joinDate,
    status: Value(status),
  ),
);
