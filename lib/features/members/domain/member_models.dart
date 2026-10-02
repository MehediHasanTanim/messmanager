import '../../../core/money/money.dart';

enum MemberStatus {
  active('active'),
  inactive('inactive'),
  left('left');

  const MemberStatus(this.databaseValue);
  final String databaseValue;

  static MemberStatus fromDatabase(String value) =>
      MemberStatus.values.firstWhere(
        (status) => status.databaseValue == value,
        orElse: () => MemberStatus.inactive,
      );
}

/// A positive opening balance means the mess owes the member; a negative value
/// means the member owes the mess. Values are always stored in paisa.
class MemberDraft {
  const MemberDraft({
    required this.messId,
    required this.name,
    required this.joinDate,
    this.nickname,
    this.phone,
    this.roomNumber,
    this.avatarPath,
    this.openingBalanceMinor = 0,
    this.status = MemberStatus.active,
    this.leaveDate,
    this.notes,
  });

  final String messId;
  final String name;
  final DateTime joinDate;
  final String? nickname;
  final String? phone;
  final String? roomNumber;
  final String? avatarPath;
  final int openingBalanceMinor;
  final MemberStatus status;
  final DateTime? leaveDate;
  final String? notes;

  String? validate() {
    if (name.trim().isEmpty) return 'নাম দেওয়া আবশ্যক।';
    if (joinDate.year < 2000) return 'সঠিক যোগদানের তারিখ দিন।';
    if (leaveDate != null &&
        _dateOnly(leaveDate!).isBefore(_dateOnly(joinDate))) {
      return 'ছাড়ার তারিখ যোগদানের তারিখের আগে হতে পারে না।';
    }
    // The database integer range is deliberately checked before a write.
    if (openingBalanceMinor.abs() > 9000000000000000000) {
      return 'শুরুর ব্যালেন্সটি সঠিক নয়।';
    }
    if (status == MemberStatus.left && leaveDate == null) {
      return 'ছাড়ার তারিখ দিন।';
    }
    return null;
  }
}

class MemberFinancialSummary {
  const MemberFinancialSummary({
    required this.mealUnits,
    required this.mealCost,
    required this.deposits,
    required this.expensesPaid,
    required this.adjustmentDebits,
    required this.adjustmentCredits,
    required this.openingBalance,
  });

  final int mealUnits;
  final Money mealCost;
  final Money deposits;
  final Money expensesPaid;
  final Money adjustmentDebits;
  final Money adjustmentCredits;
  final Money openingBalance;

  Money get totalPayable =>
      mealCost +
      adjustmentDebits +
      (openingBalance.isNegative ? -openingBalance : Money.zero);
  Money get totalCredit =>
      deposits +
      expensesPaid +
      adjustmentCredits +
      (openingBalance.isPositive ? openingBalance : Money.zero);
  Money get finalBalance => totalCredit - totalPayable;
}

class MemberMonthlyHistory {
  const MemberMonthlyHistory({
    required this.monthStart,
    required this.mealUnits,
    required this.finalBalanceMinor,
  });

  final DateTime monthStart;
  final int mealUnits;
  final int finalBalanceMinor;
}

DateTime _dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);
