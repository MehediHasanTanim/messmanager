enum GuestChargeMode {
  addToHostMeal('addToHostMeal'),
  directCharge('directCharge'),
  generalMess('generalMess');

  const GuestChargeMode(this.databaseValue);
  final String databaseValue;
  static GuestChargeMode fromDatabase(String value) =>
      GuestChargeMode.values.firstWhere(
        (mode) => mode.databaseValue == value,
        orElse: () => GuestChargeMode.generalMess,
      );
}

enum SpecialMealDistribution {
  equal('equal'),
  custom('custom'),
  singleMember('oneMember');

  const SpecialMealDistribution(this.databaseValue);
  final String databaseValue;
}

class GuestMealDraft {
  const GuestMealDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.hostMemberId,
    required this.date,
    required this.guestCount,
    required this.mealUnits,
    required this.chargeMode,
    this.guestName,
    this.directChargeMinor = 0,
    this.notes,
  });
  final String messId;
  final String accountingMonthId;
  final String hostMemberId;
  final DateTime date;
  final String? guestName;
  final int guestCount;
  final int mealUnits;
  final GuestChargeMode chargeMode;
  final int directChargeMinor;
  final String? notes;

  String? validate() {
    if (hostMemberId.trim().isEmpty || guestCount < 1 || mealUnits < 0) {
      return 'Host, guest count, and meal units are required.';
    }
    if (chargeMode == GuestChargeMode.directCharge && directChargeMinor <= 0) {
      return 'A direct-charge guest meal needs an amount.';
    }
    if (chargeMode != GuestChargeMode.directCharge && directChargeMinor != 0) {
      return 'Direct charge is only allowed in direct-charge mode.';
    }
    return null;
  }
}

class GuestMealSummary {
  const GuestMealSummary({
    required this.guestCount,
    required this.includedUnits,
    required this.directChargeMinor,
  });
  final int guestCount;
  final int includedUnits;
  final int directChargeMinor;
}

class SpecialMealDraft {
  const SpecialMealDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.date,
    required this.title,
    required this.totalCostMinor,
    required this.distribution,
    required this.participantIds,
    this.customAllocations = const {},
    this.notes,
  });
  final String messId;
  final String accountingMonthId;
  final DateTime date;
  final String title;
  final int totalCostMinor;
  final SpecialMealDistribution distribution;
  final List<String> participantIds;
  final Map<String, int> customAllocations;
  final String? notes;
}
