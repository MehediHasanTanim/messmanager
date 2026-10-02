import '../money/accounting_period.dart';
import '../money/meal_units.dart';
import '../money/member_balance.dart';
import '../money/money.dart';

/// Feature-specific entities replace these small records as their domain grows.
class DomainRecord {
  const DomainRecord({required this.id, required this.values});

  final String id;
  final Map<String, Object?> values;
}

abstract interface class MessRepository {
  Future<DomainRecord?> findById(String id);
  Future<void> save(DomainRecord mess);
}

abstract interface class MemberRepository {
  Stream<List<DomainRecord>> watchActive(String messId);
  Future<void> save(DomainRecord member);
  Future<void> changeStatus(String memberId, String status);
}

abstract interface class AccountingMonthRepository {
  Future<DomainRecord?> activeForMess(String messId);
  Future<void> save(DomainRecord accountingMonth);
  Stream<List<DomainRecord>> watchForMess(String messId);
}

abstract interface class MealRepository {
  Future<MealUnits> totalUnits(String accountingMonthId);
  Future<void> saveDailyEntries(List<DomainRecord> entries);
}

abstract interface class ExpenseRepository {
  Future<Money> totalForMonth(String accountingMonthId);
  Future<void> save(DomainRecord expense);
}

abstract interface class DepositRepository {
  Future<Money> totalForMember(String memberId, String accountingMonthId);
  Future<void> save(DomainRecord deposit);
}

abstract interface class UtilityRepository {
  Future<void> saveBill(DomainRecord bill, List<DomainRecord> allocations);
}

abstract interface class SettlementRepository {
  Future<MemberBalance?> memberBalance(
    String memberId,
    AccountingPeriod period,
  );
  Future<void> saveSnapshot(
    DomainRecord settlement,
    List<DomainRecord> members,
  );
}

abstract interface class SettingsRepository {
  Future<DomainRecord?> find(String key);
  Future<void> save(DomainRecord setting);
}

abstract interface class BackupRepository {
  Future<DomainRecord> createBackup();
  Future<void> restoreBackup(DomainRecord backup);
}
