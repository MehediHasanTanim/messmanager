import 'money.dart';

enum MemberBalanceDirection { messOwesMember, memberOwesMess, settled }

class MemberBalance {
  const MemberBalance({required this.totalPayable, required this.totalCredit});

  final Money totalPayable;
  final Money totalCredit;

  Money get finalBalance => totalCredit - totalPayable;

  MemberBalanceDirection get direction => switch (finalBalance.minorUnits) {
    > 0 => MemberBalanceDirection.messOwesMember,
    < 0 => MemberBalanceDirection.memberOwesMess,
    _ => MemberBalanceDirection.settled,
  };
}
