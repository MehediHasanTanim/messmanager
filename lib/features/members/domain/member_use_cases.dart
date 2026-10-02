import '../../../core/database/app_database.dart';
import '../../../core/money/money.dart';
import '../data/member_repository.dart';
import 'member_models.dart';

class AddMember {
  AddMember(this._repository);
  final DriftMemberRepository _repository;
  Future<void> call({required String id, required MemberDraft draft}) =>
      _repository.add(id, draft);
}

class UpdateMember {
  UpdateMember(this._repository);
  final DriftMemberRepository _repository;
  Future<void> call({required String id, required MemberDraft draft}) =>
      _repository.update(id, draft);
}

class ChangeMemberStatus {
  ChangeMemberStatus(this._repository);
  final DriftMemberRepository _repository;
  Future<void> call(
    String memberId,
    MemberStatus status, {
    DateTime? leaveDate,
  }) => _repository.changeStatus(memberId, status, leaveDate: leaveDate);
}

class GetMemberFinancialSummary {
  GetMemberFinancialSummary(this._database);
  final AppDatabase _database;

  Future<MemberFinancialSummary> call({
    required String memberId,
    required String monthId,
  }) async {
    final meals = await _database.memberDao.watchMeals(memberId, monthId).first;
    final deposits = await _database.memberDao
        .watchDeposits(memberId, monthId)
        .first;
    final paid = await _database.memberDao
        .watchExpensesPaid(memberId, monthId)
        .first;
    final adjustments = await _database.memberDao
        .watchAdjustments(memberId, monthId)
        .first;
    final member = await _database.memberDao.findById(memberId);
    final totalUnits = await _database.mealDao.totalUnitsForMonth(monthId);
    final mealExpenses = await _database.expenseDao.mealExpenseTotalForMonth(
      monthId,
    );
    final memberUnits = meals.fold(0, (sum, entry) => sum + entry.totalUnits);
    final mealCost = totalUnits == 0
        ? 0
        : (mealExpenses * memberUnits) ~/ totalUnits;
    var debits = 0;
    var credits = 0;
    for (final adjustment in adjustments) {
      if (adjustment.direction == 'debit') {
        debits += adjustment.amountMinor;
      } else {
        credits += adjustment.amountMinor;
      }
    }
    return MemberFinancialSummary(
      mealUnits: memberUnits,
      mealCost: Money(mealCost),
      deposits: Money(deposits.fold(0, (sum, item) => sum + item.amountMinor)),
      expensesPaid: Money(paid.fold(0, (sum, item) => sum + item.amountMinor)),
      adjustmentDebits: Money(debits),
      adjustmentCredits: Money(credits),
      openingBalance: Money(member?.openingBalanceMinor ?? 0),
    );
  }
}
