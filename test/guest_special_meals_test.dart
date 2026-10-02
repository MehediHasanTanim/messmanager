import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/guest_special/domain/amount_allocator.dart';
import 'package:mess_manager_bd/features/guest_special/domain/guest_special_models.dart';
import 'package:mess_manager_bd/features/guest_special/domain/guest_special_use_cases.dart';

void main() {
  group('AmountAllocator', () {
    const allocator = AmountAllocator();

    test('splits odd minor amounts deterministically', () {
      expect(allocator.equal(100, ['c', 'a', 'b']), {
        'a': 34,
        'b': 33,
        'c': 33,
      });
    });

    test('supports one and many participants', () {
      expect(allocator.equal(99, ['only']), {'only': 99});
      expect(allocator.equal(5, ['a', 'b', 'c', 'd']), {
        'a': 2,
        'b': 1,
        'c': 1,
        'd': 1,
      });
    });

    test('rejects custom totals that do not reconcile', () {
      expect(
        () => allocator.custom(
          amountMinor: 100,
          participantIds: ['a', 'b'],
          allocations: {'a': 30, 'b': 60},
        ),
        throwsArgumentError,
      );
    });
  });

  group('guest and special meals', () {
    late AppDatabase database;

    setUp(() async {
      database = AppDatabase.forTesting(NativeDatabase.memory());
      await database.messDao.create(
        MessesCompanion.insert(
          id: 'mess',
          name: 'Test',
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
      for (final id in ['a', 'b', 'c']) {
        await database.memberDao.create(
          MembersCompanion.insert(
            id: id,
            messId: 'mess',
            name: id,
            joinDate: DateTime(2026, 10, 1),
          ),
        );
      }
    });

    tearDown(() => database.close());

    test('keeps direct guest charges out of meal-rate units', () async {
      final add = AddGuestMeal(database);
      await add(
        id: 'direct',
        draft: _guest(GuestChargeMode.directCharge, units: 100, charge: 5000),
      );
      await add(
        id: 'general',
        draft: _guest(GuestChargeMode.generalMess, units: 150),
      );
      await add(
        id: 'host',
        draft: _guest(GuestChargeMode.addToHostMeal, units: 50),
      );

      final summary = await GetGuestMealSummary(database)('month');
      expect(summary.directChargeMinor, 5000);
      expect(summary.includedUnits, 200);
      expect(await database.mealDao.totalUnitsForMonth('month'), 200);
    });

    test('creates reconciled special-meal allocation snapshots', () async {
      await CreateSpecialMeal(database)(
        id: 'special',
        draft: SpecialMealDraft(
          messId: 'mess',
          accountingMonthId: 'month',
          date: DateTime(2026, 10, 2),
          title: 'Friday dinner',
          totalCostMinor: 100,
          distribution: SpecialMealDistribution.equal,
          participantIds: ['c', 'a', 'b'],
        ),
      );
      final allocations = await database.mealDao.specialMealParticipants(
        'special',
      );
      expect(
        allocations.fold(0, (sum, item) => sum + item.shareAmountMinor),
        100,
      );
      expect(
        allocations.firstWhere((item) => item.memberId == 'a').shareAmountMinor,
        34,
      );
    });
  });
}

GuestMealDraft _guest(
  GuestChargeMode mode, {
  required int units,
  int charge = 0,
}) => GuestMealDraft(
  messId: 'mess',
  accountingMonthId: 'month',
  hostMemberId: 'a',
  date: DateTime(2026, 10, 2),
  guestCount: 1,
  mealUnits: units,
  chargeMode: mode,
  directChargeMinor: charge,
);
