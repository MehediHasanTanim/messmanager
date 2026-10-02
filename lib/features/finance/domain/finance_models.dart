enum UtilityDistribution { allActive, selectedMembers, custom }

extension UtilityDistributionValue on UtilityDistribution {
  String get databaseValue => switch (this) {
    UtilityDistribution.allActive => 'allActive',
    UtilityDistribution.selectedMembers => 'selectedMembers',
    UtilityDistribution.custom => 'custom',
  };
}

enum DepositMethod { cash, bkash, nagad, rocket, bank, other }

extension DepositMethodValue on DepositMethod {
  String get databaseValue => name;
  String get label => switch (this) {
    DepositMethod.cash => 'Cash',
    DepositMethod.bkash => 'bKash',
    DepositMethod.nagad => 'Nagad',
    DepositMethod.rocket => 'Rocket',
    DepositMethod.bank => 'Bank',
    DepositMethod.other => 'Other',
  };
}

enum AdjustmentDirection { debit, credit }

class UtilityBillDraft {
  const UtilityBillDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.billType,
    required this.amountMinor,
    required this.billingMonth,
    required this.distribution,
    this.memberIds = const [],
    this.customAllocations = const {},
    this.dueDate,
    this.notes,
    this.receiptPath,
  });
  final String messId, accountingMonthId, billType;
  final int amountMinor;
  final DateTime billingMonth;
  final UtilityDistribution distribution;
  final List<String> memberIds;
  final Map<String, int> customAllocations;
  final DateTime? dueDate;
  final String? notes, receiptPath;

  String? validate() {
    if (billType.trim().isEmpty) return 'Bill type is required.';
    if (amountMinor <= 0) return 'Enter a valid bill amount.';
    if (distribution != UtilityDistribution.allActive && memberIds.isEmpty)
      return 'Select at least one member.';
    return null;
  }
}

class DepositDraft {
  const DepositDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.memberId,
    required this.date,
    required this.amountMinor,
    required this.method,
    this.reference,
    this.notes,
  });
  final String messId, accountingMonthId, memberId;
  final DateTime date;
  final int amountMinor;
  final DepositMethod method;
  final String? reference, notes;
  String? validate() => memberId.trim().isEmpty || amountMinor <= 0
      ? 'Member and valid amount are required.'
      : null;
}

class AdjustmentDraft {
  const AdjustmentDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.memberId,
    required this.date,
    required this.amountMinor,
    required this.direction,
    required this.reason,
    this.type = 'manual',
    this.notes,
  });
  final String messId, accountingMonthId, memberId, type, reason;
  final DateTime date;
  final int amountMinor;
  final AdjustmentDirection direction;
  final String? notes;
  String? validate() =>
      memberId.trim().isEmpty || reason.trim().isEmpty || amountMinor <= 0
      ? 'Member, reason and valid amount are required.'
      : null;
}

class UtilitySummary {
  const UtilitySummary({
    required this.totalMinor,
    required this.paidMinor,
    required this.unpaidMinor,
  });
  final int totalMinor, paidMinor, unpaidMinor;
}

class DepositSummary {
  const DepositSummary({required this.totalMinor, required this.count});
  final int totalMinor, count;
}
