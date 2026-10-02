// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import 'amount_allocator.dart';
import 'guest_special_models.dart';

class AddGuestMeal {
  AddGuestMeal(this._database);
  final AppDatabase _database;
  Future<void> call({required String id, required GuestMealDraft draft}) =>
      _save(id, draft);
  Future<void> _save(String id, GuestMealDraft draft) {
    final error = draft.validate();
    if (error != null) throw ArgumentError(error);
    return _database.mealDao.saveGuestMealForOpenMonth(
      GuestMealsCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        hostMemberId: Value(draft.hostMemberId),
        mealDate: Value(_day(draft.date)),
        guestName: Value(_nullable(draft.guestName)),
        guestCount: Value(draft.guestCount),
        mealUnits: Value(draft.mealUnits),
        chargeMethod: Value(draft.chargeMode.databaseValue),
        directChargeMinor: Value(draft.directChargeMinor),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

class UpdateGuestMeal extends AddGuestMeal {
  UpdateGuestMeal(super._database);
}

class DeleteGuestMeal {
  DeleteGuestMeal(this._database);
  final AppDatabase _database;
  Future<void> call(String id, String accountingMonthId) =>
      _database.mealDao.deleteGuestMeal(id, accountingMonthId);
}

class GetGuestMealSummary {
  GetGuestMealSummary(this._database);
  final AppDatabase _database;
  Future<GuestMealSummary> call(String accountingMonthId) async {
    final meals = await _database.mealDao.guestMealsForMonth(accountingMonthId);
    return GuestMealSummary(
      guestCount: meals.fold(0, (sum, meal) => sum + meal.guestCount),
      includedUnits: meals
          .where(
            (meal) =>
                meal.chargeMethod != GuestChargeMode.directCharge.databaseValue,
          )
          .fold(0, (sum, meal) => sum + meal.mealUnits),
      directChargeMinor: meals.fold(
        0,
        (sum, meal) => sum + meal.directChargeMinor,
      ),
    );
  }
}

class SelectParticipants {
  List<String> call(Iterable<String> memberIds) {
    final ids = memberIds.toSet().toList()..sort();
    if (ids.isEmpty || ids.any((id) => id.trim().isEmpty))
      throw ArgumentError('Select at least one participant.');
    return ids;
  }
}

class AllocateSpecialMealCost {
  AllocateSpecialMealCost([this._allocator = const AmountAllocator()]);
  final AmountAllocator _allocator;
  Map<String, int> call(SpecialMealDraft draft) => switch (draft.distribution) {
    SpecialMealDistribution.equal => _allocator.equal(
      draft.totalCostMinor,
      draft.participantIds,
    ),
    SpecialMealDistribution.custom => _allocator.custom(
      amountMinor: draft.totalCostMinor,
      participantIds: draft.participantIds,
      allocations: draft.customAllocations,
    ),
    SpecialMealDistribution.singleMember =>
      draft.participantIds.length == 1
          ? _allocator.single(draft.totalCostMinor, draft.participantIds.single)
          : throw ArgumentError('Select exactly one member.'),
  };
}

class CreateSpecialMeal {
  CreateSpecialMeal(
    this._database, [
    this._allocator = const AmountAllocator(),
  ]);
  final AppDatabase _database;
  final AmountAllocator _allocator;
  Future<void> call({
    required String id,
    required SpecialMealDraft draft,
  }) async {
    if (draft.title.trim().isEmpty || draft.totalCostMinor <= 0)
      throw ArgumentError('A title and positive cost are required.');
    final allocations = AllocateSpecialMealCost(_allocator)(draft);
    await _database.mealDao.saveSpecialMealForOpenMonth(
      SpecialMealsCompanion(
        id: Value(id),
        messId: Value(draft.messId),
        accountingMonthId: Value(draft.accountingMonthId),
        date: Value(_day(draft.date)),
        title: Value(draft.title.trim()),
        totalCostMinor: Value(draft.totalCostMinor),
        distributionMethod: Value(draft.distribution.databaseValue),
        notes: Value(_nullable(draft.notes)),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
      [
        for (final entry in allocations.entries)
          SpecialMealMembersCompanion.insert(
            id: 'special-member-$id-${entry.key}',
            specialMealId: id,
            memberId: entry.key,
            shareAmountMinor: entry.value,
          ),
      ],
    );
  }
}

class UpdateSpecialMeal extends CreateSpecialMeal {
  UpdateSpecialMeal(super._database, [super._allocator]);
}

class DeleteSpecialMeal {
  DeleteSpecialMeal(this._database);
  final AppDatabase _database;
  Future<void> call(String id, String monthId) =>
      _database.mealDao.deleteSpecialMeal(id, monthId);
}

DateTime _day(DateTime date) => DateTime(date.year, date.month, date.day);
String? _nullable(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}
