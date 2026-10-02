import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/features/members/data/member_repository.dart';
import 'package:mess_manager_bd/features/members/domain/member_models.dart';

void main() {
  late AppDatabase database;
  late DriftMemberRepository repository;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    repository = DriftMemberRepository(database);
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
  });

  tearDown(() => database.close());

  test('adds, edits, deactivates, and reactivates a member', () async {
    await repository.add('member', _draft(name: 'Rahim', opening: -12500));
    expect((await repository.findById('member'))?.openingBalanceMinor, -12500);

    await repository.update(
      'member',
      _draft(name: 'Rahim Uddin', opening: 8000),
    );
    expect((await repository.findById('member'))?.name, 'Rahim Uddin');

    await repository.changeStatus(
      'member',
      MemberStatus.left,
      leaveDate: DateTime(2026, 10, 15),
    );
    expect((await repository.findById('member'))?.status, 'left');
    expect(
      (await repository.findById('member'))?.leaveDate,
      DateTime(2026, 10, 15),
    );

    await repository.changeStatus('member', MemberStatus.active);
    final reactivated = await repository.findById('member');
    expect(reactivated?.status, 'active');
    expect(reactivated?.leaveDate, isNull);
  });

  test('leaving mid-month retains historical transactions', () async {
    await repository.add('member', _draft(name: 'Rahim'));
    await database.mealDao.saveEntry(
      MealEntriesCompanion.insert(
        id: 'meal',
        messId: 'mess',
        accountingMonthId: 'month',
        memberId: 'member',
        mealDate: DateTime(2026, 10, 10),
        totalUnits: const Value(300),
      ),
    );
    await repository.changeStatus(
      'member',
      MemberStatus.left,
      leaveDate: DateTime(2026, 10, 15),
    );

    expect(await repository.watchMeals('member', 'month').first, hasLength(1));
  });

  test('searches by name and filters by status', () async {
    await repository.add('rahim', _draft(name: 'Rahim'));
    await repository.add('karim', _draft(name: 'Karim'));
    await repository.changeStatus('karim', MemberStatus.inactive);

    expect(
      await repository.searchMembers('mess', query: 'rah').first,
      hasLength(1),
    );
    expect(
      await repository.searchMembers('mess', status: MemberStatus.active).first,
      hasLength(1),
    );
    expect(
      await repository
          .searchMembers('mess', status: MemberStatus.inactive)
          .first,
      hasLength(1),
    );
  });
}

MemberDraft _draft({required String name, int opening = 0}) => MemberDraft(
  messId: 'mess',
  name: name,
  joinDate: DateTime(2026, 10, 1),
  openingBalanceMinor: opening,
);
