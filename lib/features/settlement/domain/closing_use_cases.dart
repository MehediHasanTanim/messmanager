import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../finance/domain/finance_models.dart';
import '../../finance/domain/finance_use_cases.dart';
import 'settlement_use_cases.dart';

class CloseAccountingMonth {
  CloseAccountingMonth(this._database, [this._drafts]);
  final AppDatabase _database;
  final GenerateDraftSettlement? _drafts;
  Future<DraftSettlement> call({
    required String messId,
    required String monthId,
  }) async {
    final draft = await (_drafts ?? GenerateDraftSettlement(_database))(
      messId: messId,
      monthId: monthId,
    );
    if (!draft.canGenerate)
      throw StateError('Resolve blocking settlement issues before closing.');
    final now = DateTime.now();
    final settlementId = 'settlement-$monthId';
    await _database.settlementDao.closeMonthAtomically(
      settlement: SettlementsCompanion.insert(
        id: settlementId,
        messId: messId,
        accountingMonthId: monthId,
        totalMealUnits: draft.result.totalMealsScaled,
        totalMealExpenseMinor: draft.input.mealExpenseMinor,
        mealRateScaled: draft.result.rate.internalRateScaled,
        totalSharedExpenseMinor: draft.input.sharedExpenseTotalMinor,
        totalDepositMinor: draft.input.deposits.values.fold(
          0,
          (sum, value) => sum + value,
        ),
        createdAt: Value(now),
        closedAt: Value(now),
      ),
      memberSnapshots: [
        for (final row in draft.result.members)
          MemberSettlementsCompanion.insert(
            id: '$settlementId-${row.memberId}',
            settlementId: settlementId,
            memberId: row.memberId,
            mealUnits: Value(row.mealUnitsScaled),
            mealCostMinor: Value(row.mealCostMinor),
            guestChargeMinor: Value(row.guestChargeMinor),
            specialMealChargeMinor: Value(row.specialMealMinor),
            utilityShareMinor: Value(row.utilityMinor),
            sharedExpenseShareMinor: Value(row.sharedExpenseMinor),
            adjustmentDebitMinor: Value(row.debitAdjustmentMinor),
            adjustmentCreditMinor: Value(row.creditAdjustmentMinor),
            previousBalanceMinor: Value(row.previousBalanceMinor),
            depositMinor: Value(row.depositsMinor),
            memberPaidExpenseMinor: Value(row.memberPaidExpenseMinor),
            totalPayableMinor: row.totalPayableMinor,
            totalCreditMinor: row.totalCreditMinor,
            finalBalanceMinor: row.finalBalanceMinor,
          ),
      ],
      finalMealRateScaled: draft.result.rate.internalRateScaled,
      audit: AuditEntriesCompanion.insert(
        id: 'audit-close-$monthId-${now.microsecondsSinceEpoch}',
        messId: messId,
        entityType: 'accountingMonth',
        entityId: monthId,
        action: 'closed',
        newValueJson: Value('{"settlementId":"$settlementId"}'),
      ),
    );
    return draft;
  }
}

class ReopenAccountingMonth {
  ReopenAccountingMonth(this._database);
  final AppDatabase _database;
  Future<void> call({
    required String messId,
    required String monthId,
    required bool authenticated,
  }) {
    if (!authenticated)
      return Future.error(
        StateError('Authentication is required to reopen a month.'),
      );
    return _database.settlementDao.reopenMonth(
      messId: messId,
      monthId: monthId,
      auditId: 'audit-reopen-$monthId-${DateTime.now().microsecondsSinceEpoch}',
    );
  }
}

class CarryForwardBalances {
  CarryForwardBalances(this._database);
  final AppDatabase _database;

  /// Positive balances are member credits; negative balances are member dues.
  Future<void> call({
    required String messId,
    required String nextMonthId,
    required Map<String, int> selectedBalances,
  }) async {
    for (final entry in selectedBalances.entries) {
      if (entry.value == 0) continue;
      await AddAdjustment(_database)(
        id: 'carry-$nextMonthId-${entry.key}',
        draft: AdjustmentDraft(
          messId: messId,
          accountingMonthId: nextMonthId,
          memberId: entry.key,
          date: DateTime.now(),
          amountMinor: entry.value.abs(),
          direction: entry.value > 0
              ? AdjustmentDirection.credit
              : AdjustmentDirection.debit,
          type: 'carryForward',
          reason: 'Balance carried forward',
        ),
      );
    }
  }
}
