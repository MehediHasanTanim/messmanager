enum ExpenseCategoryType {
  mealExpense('mealExpense'),
  sharedExpense('sharedExpense'),
  other('other');

  const ExpenseCategoryType(this.databaseValue);
  final String databaseValue;
  static ExpenseCategoryType fromDatabase(String value) =>
      ExpenseCategoryType.values.firstWhere(
        (type) => type.databaseValue == value,
        orElse: () => ExpenseCategoryType.other,
      );
}

class ExpenseDraft {
  const ExpenseDraft({
    required this.messId,
    required this.accountingMonthId,
    required this.date,
    required this.categoryId,
    required this.amountMinor,
    this.description,
    this.vendor,
    this.paidByMemberId,
    this.paymentSource,
    this.distributionMethod,
    this.receiptPath,
    this.notes,
  });

  final String messId;
  final String accountingMonthId;
  final DateTime date;
  final String categoryId;
  final int amountMinor;
  final String? description;
  final String? vendor;
  final String? paidByMemberId;
  final String? paymentSource;
  final String? distributionMethod;
  final String? receiptPath;
  final String? notes;

  String? validate() {
    if (categoryId.trim().isEmpty || amountMinor <= 0) {
      return 'A category and positive amount are required.';
    }
    return null;
  }
}

class ExpenseSummary {
  const ExpenseSummary({
    required this.totalMinor,
    required this.mealExpenseMinor,
    required this.sharedExpenseMinor,
    required this.memberPaidMinor,
  });
  final int totalMinor;
  final int mealExpenseMinor;
  final int sharedExpenseMinor;
  final int memberPaidMinor;
}

class ExpenseCategorySeed {
  const ExpenseCategorySeed(this.name, this.nameBn, this.type);
  final String name;
  final String nameBn;
  final ExpenseCategoryType type;
}

const systemExpenseCategorySeeds = [
  ExpenseCategorySeed('Rice', 'চাল', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Fish', 'মাছ', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Meat', 'মাংস', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Vegetables', 'সবজি', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Eggs', 'ডিম', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Oil', 'তেল', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Spices', 'মসলা', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Lentils', 'ডাল', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed('Breakfast', 'নাস্তা', ExpenseCategoryType.mealExpense),
  ExpenseCategorySeed(
    'Other grocery',
    'অন্যান্য বাজার',
    ExpenseCategoryType.mealExpense,
  ),
  ExpenseCategorySeed('Maid', 'বুয়া', ExpenseCategoryType.sharedExpense),
  ExpenseCategorySeed('Cook', 'রাঁধুনি', ExpenseCategoryType.sharedExpense),
  ExpenseCategorySeed(
    'Cleaning',
    'পরিষ্কার',
    ExpenseCategoryType.sharedExpense,
  ),
  ExpenseCategorySeed(
    'Maintenance',
    'রক্ষণাবেক্ষণ',
    ExpenseCategoryType.sharedExpense,
  ),
];
