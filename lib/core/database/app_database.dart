import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Messes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  TextColumn get managerName => text()();
  TextColumn get managerPhone => text().nullable()();
  TextColumn get currencyCode => text().withDefault(const Constant('BDT'))();
  TextColumn get defaultLanguage => text().withDefault(const Constant('bn'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Members extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get name => text()();
  TextColumn get nickname => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get roomNumber => text().nullable()();
  TextColumn get avatarPath => text().nullable()();
  DateTimeColumn get joinDate => dateTime()();
  DateTimeColumn get leaveDate => dateTime().nullable()();
  IntColumn get openingBalanceMinor =>
      integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    "CHECK (status IN ('active', 'inactive', 'left'))",
    'CHECK (leave_date IS NULL OR leave_date >= join_date)',
  ];
}

class AccountingMonths extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  IntColumn get year => integer()();
  IntColumn get month => integer()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get finalMealRateScaled => integer().nullable()();
  DateTimeColumn get closedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(mess_id, year, month)',
    'CHECK (year >= 2000)',
    'CHECK (month BETWEEN 1 AND 12)',
    "CHECK (status IN ('active', 'draftSettlement', 'closed'))",
  ];
}

class MealEntries extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  DateTimeColumn get mealDate => dateTime()();
  IntColumn get breakfastUnits => integer().withDefault(const Constant(0))();
  IntColumn get lunchUnits => integer().withDefault(const Constant(0))();
  IntColumn get dinnerUnits => integer().withDefault(const Constant(0))();
  IntColumn get extraUnits => integer().withDefault(const Constant(0))();
  IntColumn get totalUnits => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(mess_id, member_id, meal_date)',
    'CHECK (breakfast_units >= 0)',
    'CHECK (lunch_units >= 0)',
    'CHECK (dinner_units >= 0)',
    'CHECK (extra_units >= 0)',
    'CHECK (total_units >= 0)',
  ];
}

class GuestMeals extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  TextColumn get hostMemberId => text().references(Members, #id)();
  DateTimeColumn get mealDate => dateTime()();
  TextColumn get guestName => text().nullable()();
  IntColumn get guestCount => integer().withDefault(const Constant(1))();
  IntColumn get mealUnits => integer()();
  TextColumn get chargeMethod => text()();
  IntColumn get directChargeMinor => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (guest_count >= 1)',
    'CHECK (meal_units >= 0)',
    'CHECK (direct_charge_minor >= 0)',
    "CHECK (charge_method IN ('addToHostMeal', 'directCharge', 'generalMess'))",
  ];
}

class SpecialMeals extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text()();
  IntColumn get totalCostMinor => integer()();
  TextColumn get distributionMethod => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (total_cost_minor > 0)',
    "CHECK (distribution_method IN ('equal', 'custom', 'oneMember'))",
  ];
}

class SpecialMealMembers extends Table {
  TextColumn get id => text()();
  TextColumn get specialMealId => text().references(SpecialMeals, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  IntColumn get shareAmountMinor => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(special_meal_id, member_id)',
    'CHECK (share_amount_minor >= 0)',
  ];
}

class ExpenseCategories extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get name => text()();
  TextColumn get nameBn => text().nullable()();
  TextColumn get type => text()();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(mess_id, name)',
    "CHECK (type IN ('mealExpense', 'sharedExpense', 'other'))",
  ];
}

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get categoryId => text().references(ExpenseCategories, #id)();
  IntColumn get amountMinor => integer()();
  TextColumn get description => text().nullable()();
  TextColumn get vendor => text().nullable()();
  TextColumn get paidByMemberId => text().nullable().references(Members, #id)();
  TextColumn get paymentSource => text().nullable()();
  BoolColumn get affectsMealRate =>
      boolean().withDefault(const Constant(false))();
  TextColumn get distributionMethod => text().nullable()();
  TextColumn get receiptPath => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const ['CHECK (amount_minor > 0)'];
}

class UtilityBills extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  TextColumn get billType => text()();
  IntColumn get amountMinor => integer()();
  DateTimeColumn get billingMonth => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get paidDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('unpaid'))();
  TextColumn get paidByMemberId => text().nullable().references(Members, #id)();
  TextColumn get distributionMethod => text()();
  TextColumn get receiptPath => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (amount_minor > 0)',
    "CHECK (status IN ('paid', 'unpaid'))",
  ];
}

class UtilityBillAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get utilityBillId => text().references(UtilityBills, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  IntColumn get amountMinor => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(utility_bill_id, member_id)',
    'CHECK (amount_minor >= 0)',
  ];
}

class Deposits extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  DateTimeColumn get date => dateTime()();
  IntColumn get amountMinor => integer()();
  TextColumn get paymentMethod => text()();
  TextColumn get reference => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (amount_minor > 0)',
    "CHECK (payment_method IN ('cash', 'bkash', 'nagad', 'rocket', 'bank', 'other'))",
  ];
}

class MemberAdjustments extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
  TextColumn get direction => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get reason => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (amount_minor > 0)',
    "CHECK (direction IN ('debit', 'credit'))",
  ];
}

class Settlements extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get accountingMonthId =>
      text().references(AccountingMonths, #id)();
  IntColumn get totalMealUnits => integer()();
  IntColumn get totalMealExpenseMinor => integer()();
  IntColumn get mealRateScaled => integer()();
  IntColumn get totalSharedExpenseMinor => integer()();
  IntColumn get totalDepositMinor => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get closedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(accounting_month_id)',
    'CHECK (total_meal_units >= 0)',
    'CHECK (total_meal_expense_minor >= 0)',
    'CHECK (meal_rate_scaled >= 0)',
    'CHECK (total_shared_expense_minor >= 0)',
    'CHECK (total_deposit_minor >= 0)',
  ];
}

class MemberSettlements extends Table {
  TextColumn get id => text()();
  TextColumn get settlementId => text().references(Settlements, #id)();
  TextColumn get memberId => text().references(Members, #id)();
  IntColumn get mealUnits => integer().withDefault(const Constant(0))();
  IntColumn get mealCostMinor => integer().withDefault(const Constant(0))();
  IntColumn get guestChargeMinor => integer().withDefault(const Constant(0))();
  IntColumn get specialMealChargeMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get utilityShareMinor => integer().withDefault(const Constant(0))();
  IntColumn get sharedExpenseShareMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get adjustmentDebitMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get adjustmentCreditMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get previousBalanceMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get depositMinor => integer().withDefault(const Constant(0))();
  IntColumn get memberPaidExpenseMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get totalPayableMinor => integer()();
  IntColumn get totalCreditMinor => integer()();
  IntColumn get finalBalanceMinor => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'UNIQUE(settlement_id, member_id)',
    'CHECK (meal_units >= 0)',
    'CHECK (meal_cost_minor >= 0)',
    'CHECK (guest_charge_minor >= 0)',
    'CHECK (special_meal_charge_minor >= 0)',
    'CHECK (utility_share_minor >= 0)',
    'CHECK (shared_expense_share_minor >= 0)',
    'CHECK (adjustment_debit_minor >= 0)',
    'CHECK (adjustment_credit_minor >= 0)',
    'CHECK (deposit_minor >= 0)',
    'CHECK (member_paid_expense_minor >= 0)',
  ];
}

class Attachments extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get relativePath => text()();
  TextColumn get mimeType => text().nullable()();
  IntColumn get byteSize => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const ['CHECK (byte_size >= 0)'];
}

class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get type => text()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get scheduleJson => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const ['UNIQUE(mess_id, type)'];
}

class AppSettings extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().nullable().references(Messes, #id)();
  TextColumn get settingKey => text()();
  TextColumn get valueJson => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const ['UNIQUE(mess_id, setting_key)'];
}

class AuditEntries extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().references(Messes, #id)();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get action => text()();
  TextColumn get oldValueJson => text().nullable()();
  TextColumn get newValueJson => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BackupMetadata extends Table {
  TextColumn get id => text()();
  TextColumn get messId => text().nullable().references(Messes, #id)();
  TextColumn get fileName => text()();
  TextColumn get relativePath => text()();
  IntColumn get formatVersion => integer()();
  IntColumn get databaseVersion => integer()();
  IntColumn get byteSize => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CHECK (format_version >= 1)',
    'CHECK (database_version >= 1)',
    'CHECK (byte_size >= 0)',
  ];
}

@DriftDatabase(
  tables: [
    Messes,
    Members,
    AccountingMonths,
    MealEntries,
    GuestMeals,
    SpecialMeals,
    SpecialMealMembers,
    ExpenseCategories,
    Expenses,
    UtilityBills,
    UtilityBillAllocations,
    Deposits,
    MemberAdjustments,
    Settlements,
    MemberSettlements,
    Attachments,
    Reminders,
    AppSettings,
    AuditEntries,
    BackupMetadata,
  ],
  daos: [
    MessDao,
    MemberDao,
    AccountingMonthDao,
    MealDao,
    ExpenseDao,
    DepositDao,
    UtilityDao,
    AdjustmentDao,
    SettlementDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  static const currentSchemaVersion = 1;

  @override
  int get schemaVersion => currentSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _createIndexes();
    },
    onUpgrade: (migrator, from, to) async {
      // Each future version must add a tested, non-destructive migration here.
      if (from < 1) {
        await migrator.createAll();
        await _createIndexes();
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      // `CREATE INDEX IF NOT EXISTS` also brings existing installations up to
      // date without a destructive schema migration.
      await _createIndexes();
    },
  );

  Future<void> _createIndexes() async {
    const statements = [
      'CREATE INDEX IF NOT EXISTS idx_members_mess_status ON members(mess_id, status)',
      'CREATE INDEX IF NOT EXISTS idx_members_mess_name ON members(mess_id, name)',
      'CREATE INDEX IF NOT EXISTS idx_meal_entries_month ON meal_entries(accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_meal_entries_member_date ON meal_entries(member_id, meal_date)',
      'CREATE INDEX IF NOT EXISTS idx_meal_entries_date ON meal_entries(meal_date)',
      'CREATE INDEX IF NOT EXISTS idx_expenses_month ON expenses(accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_expenses_paid_by_member_month ON expenses(paid_by_member_id, accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_expenses_date ON expenses(date)',
      'CREATE INDEX IF NOT EXISTS idx_expenses_category ON expenses(category_id)',
      'CREATE INDEX IF NOT EXISTS idx_deposits_month ON deposits(accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_deposits_member_date ON deposits(member_id, date)',
      'CREATE INDEX IF NOT EXISTS idx_utility_bills_month ON utility_bills(accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_utility_allocations_bill ON utility_bill_allocations(utility_bill_id)',
      'CREATE INDEX IF NOT EXISTS idx_adjustments_member_month ON member_adjustments(member_id, accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_adjustments_month ON member_adjustments(accounting_month_id)',
      'CREATE INDEX IF NOT EXISTS idx_member_settlements_member ON member_settlements(member_id, settlement_id)',
      'CREATE INDEX IF NOT EXISTS idx_audit_entries_entity ON audit_entries(entity_type, entity_id)',
    ];
    for (final statement in statements) {
      await customStatement(statement);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'mess_manager_bd.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftAccessor(tables: [Messes])
class MessDao extends DatabaseAccessor<AppDatabase> with _$MessDaoMixin {
  MessDao(super.db);

  Future<void> create(MessesCompanion mess) => into(messes).insert(mess);

  Future<MessesData?> findById(String id) {
    return (select(
      messes,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  Stream<MessesData?> watchById(String id) {
    return (select(
      messes,
    )..where((table) => table.id.equals(id))).watchSingleOrNull();
  }
}

@DriftAccessor(
  tables: [
    Members,
    MealEntries,
    Deposits,
    Expenses,
    MemberAdjustments,
    MemberSettlements,
    Settlements,
    AccountingMonths,
  ],
)
class MemberDao extends DatabaseAccessor<AppDatabase> with _$MemberDaoMixin {
  MemberDao(super.db);

  Future<void> create(MembersCompanion member) => into(members).insert(member);

  Future<bool> updateMember(MembersCompanion member) {
    return update(members).replace(member);
  }

  Future<int> deleteById(String id) {
    return (delete(members)..where((table) => table.id.equals(id))).go();
  }

  Stream<List<Member>> watchActiveMembers(String messId) {
    final query = select(members)
      ..where(
        (table) => table.messId.equals(messId) & table.status.equals('active'),
      )
      ..orderBy([(table) => OrderingTerm.asc(table.name)]);
    return query.watch();
  }

  Future<int> activeCount(String messId) async {
    final count = members.id.count();
    final query = selectOnly(members)
      ..addColumns([count])
      ..where(members.messId.equals(messId) & members.status.equals('active'));
    return (await query.getSingle()).read(count) ?? 0;
  }

  /// Searches locally so the member list remains usable offline. A blank query
  /// returns every member matching [status].
  Stream<List<Member>> watchMembers(
    String messId, {
    String? status,
    String query = '',
  }) {
    final normalizedQuery = query.trim().toLowerCase();
    final statement = select(members)
      ..where((table) {
        var expression = table.messId.equals(messId);
        if (status != null && status != 'all') {
          expression = expression & table.status.equals(status);
        }
        if (normalizedQuery.isNotEmpty) {
          final pattern = '%$normalizedQuery%';
          expression =
              expression &
              (table.name.lower().like(pattern) |
                  table.nickname.lower().like(pattern) |
                  table.phone.lower().like(pattern) |
                  table.roomNumber.lower().like(pattern));
        }
        return expression;
      })
      ..orderBy([(table) => OrderingTerm.asc(table.name)]);
    return statement.watch();
  }

  Future<int> changeStatus(
    String memberId, {
    required String status,
    DateTime? leaveDate,
  }) {
    return (update(members)..where((table) => table.id.equals(memberId))).write(
      MembersCompanion(
        status: Value(status),
        leaveDate: Value(leaveDate),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<Member?> findById(String id) {
    return (select(
      members,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  Stream<List<MealEntry>> watchMeals(String memberId, String monthId) {
    final query = select(mealEntries)
      ..where(
        (table) =>
            table.memberId.equals(memberId) &
            table.accountingMonthId.equals(monthId),
      )
      ..orderBy([(table) => OrderingTerm.desc(table.mealDate)]);
    return query.watch();
  }

  Stream<List<Deposit>> watchDeposits(String memberId, String monthId) {
    final query = select(deposits)
      ..where(
        (table) =>
            table.memberId.equals(memberId) &
            table.accountingMonthId.equals(monthId),
      )
      ..orderBy([(table) => OrderingTerm.desc(table.date)]);
    return query.watch();
  }

  Stream<List<Expense>> watchExpensesPaid(String memberId, String monthId) {
    final query = select(expenses)
      ..where(
        (table) =>
            table.paidByMemberId.equals(memberId) &
            table.accountingMonthId.equals(monthId),
      )
      ..orderBy([(table) => OrderingTerm.desc(table.date)]);
    return query.watch();
  }

  Stream<List<MemberAdjustment>> watchAdjustments(
    String memberId,
    String monthId,
  ) {
    final query = select(memberAdjustments)
      ..where(
        (table) =>
            table.memberId.equals(memberId) &
            table.accountingMonthId.equals(monthId),
      )
      ..orderBy([(table) => OrderingTerm.desc(table.date)]);
    return query.watch();
  }

  Future<List<TypedResult>> monthlyHistory(String memberId) {
    final query =
        select(memberSettlements).join([
            innerJoin(
              settlements,
              settlements.id.equalsExp(memberSettlements.settlementId),
            ),
            innerJoin(
              accountingMonths,
              accountingMonths.id.equalsExp(settlements.accountingMonthId),
            ),
          ])
          ..where(memberSettlements.memberId.equals(memberId))
          ..orderBy([
            OrderingTerm.desc(accountingMonths.year),
            OrderingTerm.desc(accountingMonths.month),
          ]);
    return query.get();
  }
}

@DriftAccessor(tables: [AccountingMonths])
class AccountingMonthDao extends DatabaseAccessor<AppDatabase>
    with _$AccountingMonthDaoMixin {
  AccountingMonthDao(super.db);

  Future<void> create(AccountingMonthsCompanion month) {
    return into(accountingMonths).insert(month);
  }

  Future<AccountingMonth?> activeForMess(String messId) {
    return (select(accountingMonths)..where(
          (table) =>
              table.messId.equals(messId) & table.status.equals('active'),
        ))
        .getSingleOrNull();
  }

  /// Includes a settlement draft, which is still an open period and must not
  /// allow a second accounting month to be started.
  Future<AccountingMonth?> unclosedForMess(String messId) {
    return (select(accountingMonths)..where(
          (table) =>
              table.messId.equals(messId) & table.status.isNotValue('closed'),
        ))
        .getSingleOrNull();
  }

  Stream<List<AccountingMonth>> watchForMess(String messId) {
    final query = select(accountingMonths)
      ..where((table) => table.messId.equals(messId))
      ..orderBy([
        (table) => OrderingTerm.desc(table.year),
        (table) => OrderingTerm.desc(table.month),
      ]);
    return query.watch();
  }

  Future<AccountingMonth?> findById(String id) {
    return (select(
      accountingMonths,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  Future<int> countForMess(String messId) async {
    final count = accountingMonths.id.count();
    final query = selectOnly(accountingMonths)
      ..addColumns([count])
      ..where(accountingMonths.messId.equals(messId));
    return (await query.getSingle()).read(count) ?? 0;
  }
}

@DriftAccessor(
  tables: [
    MealEntries,
    GuestMeals,
    SpecialMeals,
    SpecialMealMembers,
    Members,
    AccountingMonths,
  ],
)
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  MealDao(super.db);

  Future<void> saveEntry(MealEntriesCompanion entry) {
    return into(mealEntries).insertOnConflictUpdate(entry);
  }

  Future<void> saveDailyEntries(List<MealEntriesCompanion> entries) {
    return transaction(() async {
      for (final entry in entries) {
        await into(mealEntries).insertOnConflictUpdate(entry);
      }
    });
  }

  /// Writes a complete daily sheet in one transaction. The open-month check is
  /// intentionally in the same transaction as the writes.
  Future<void> saveDailyEntriesForOpenMonth(
    String accountingMonthId,
    List<MealEntriesCompanion> entries,
  ) {
    return transaction(() async {
      final month =
          await (select(accountingMonths)
                ..where((table) => table.id.equals(accountingMonthId)))
              .getSingleOrNull();
      if (month == null) throw StateError('Accounting month not found.');
      if (month.status == 'closed') {
        throw StateError('Closed accounting months cannot be edited.');
      }
      for (final entry in entries) {
        await into(mealEntries).insertOnConflictUpdate(entry);
      }
    });
  }

  Future<int> totalUnitsForMonth(String accountingMonthId) async {
    final memberTotal = mealEntries.totalUnits.sum();
    final memberQuery = selectOnly(mealEntries)
      ..addColumns([memberTotal])
      ..where(mealEntries.accountingMonthId.equals(accountingMonthId));
    final guestTotal = guestMeals.mealUnits.sum();
    final guestQuery = selectOnly(guestMeals)
      ..addColumns([guestTotal])
      ..where(
        guestMeals.accountingMonthId.equals(accountingMonthId) &
            guestMeals.chargeMethod.isNotValue('directCharge'),
      );
    return ((await memberQuery.getSingle()).read(memberTotal) ?? 0) +
        ((await guestQuery.getSingle()).read(guestTotal) ?? 0);
  }

  Future<int> totalUnitsForDate(String messId, DateTime date) async {
    final total = mealEntries.totalUnits.sum();
    final query = selectOnly(mealEntries)
      ..addColumns([total])
      ..where(
        mealEntries.messId.equals(messId) &
            mealEntries.mealDate.equals(
              DateTime(date.year, date.month, date.day),
            ),
      );
    return (await query.getSingle()).read(total) ?? 0;
  }

  Stream<List<MealEntry>> watchForDate(String messId, DateTime date) {
    final query = select(mealEntries)
      ..where(
        (table) => table.messId.equals(messId) & table.mealDate.equals(date),
      );
    return query.watch();
  }

  Future<List<MealEntry>> forDate(String messId, DateTime date) {
    final query = select(mealEntries)
      ..where(
        (table) => table.messId.equals(messId) & table.mealDate.equals(date),
      )
      ..orderBy([(table) => OrderingTerm.asc(table.memberId)]);
    return query.get();
  }

  Future<List<Member>> eligibleMembersForDate(String messId, DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    final query = select(members)
      ..where(
        (table) =>
            table.messId.equals(messId) &
            table.status.equals('active') &
            table.joinDate.isSmallerOrEqualValue(day) &
            (table.leaveDate.isNull() |
                table.leaveDate.isBiggerOrEqualValue(day)),
      )
      ..orderBy([(table) => OrderingTerm.asc(table.name)]);
    return query.get();
  }

  Future<List<MealEntry>> forMonth(String accountingMonthId) {
    final query = select(mealEntries)
      ..where((table) => table.accountingMonthId.equals(accountingMonthId))
      ..orderBy([(table) => OrderingTerm.asc(table.mealDate)]);
    return query.get();
  }

  Future<void> createGuestMeal(GuestMealsCompanion guestMeal) {
    return into(guestMeals).insert(guestMeal);
  }

  Future<List<GuestMeal>> guestMealsForMonth(String accountingMonthId) {
    final query = select(guestMeals)
      ..where((table) => table.accountingMonthId.equals(accountingMonthId))
      ..orderBy([(table) => OrderingTerm.desc(table.mealDate)]);
    return query.get();
  }

  Future<GuestMeal?> guestMealById(String id) => (select(
    guestMeals,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<void> saveGuestMealForOpenMonth(GuestMealsCompanion guestMeal) {
    return transaction(() async {
      final monthId = guestMeal.accountingMonthId.value;
      await _assertMonthOpen(monthId);
      await into(guestMeals).insertOnConflictUpdate(guestMeal);
    });
  }

  Future<void> deleteGuestMeal(String id, String accountingMonthId) {
    return transaction(() async {
      await _assertMonthOpen(accountingMonthId);
      await (delete(guestMeals)..where((table) => table.id.equals(id))).go();
    });
  }

  Future<void> createSpecialMeal(
    SpecialMealsCompanion specialMeal,
    List<SpecialMealMembersCompanion> participants,
  ) {
    return transaction(() async {
      await into(specialMeals).insert(specialMeal);
      await batch((batch) => batch.insertAll(specialMealMembers, participants));
    });
  }

  Future<List<SpecialMeal>> specialMealsForMonth(String accountingMonthId) {
    final query = select(specialMeals)
      ..where((table) => table.accountingMonthId.equals(accountingMonthId))
      ..orderBy([(table) => OrderingTerm.desc(table.date)]);
    return query.get();
  }

  Future<SpecialMeal?> specialMealById(String id) => (select(
    specialMeals,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<List<SpecialMealMember>> specialMealParticipants(
    String specialMealId,
  ) {
    return (select(
      specialMealMembers,
    )..where((table) => table.specialMealId.equals(specialMealId))).get();
  }

  Future<void> saveSpecialMealForOpenMonth(
    SpecialMealsCompanion specialMeal,
    List<SpecialMealMembersCompanion> participants,
  ) {
    return transaction(() async {
      await _assertMonthOpen(specialMeal.accountingMonthId.value);
      await into(specialMeals).insertOnConflictUpdate(specialMeal);
      await (delete(
            specialMealMembers,
          )..where((table) => table.specialMealId.equals(specialMeal.id.value)))
          .go();
      await batch((batch) => batch.insertAll(specialMealMembers, participants));
    });
  }

  Future<void> deleteSpecialMeal(String id, String accountingMonthId) {
    return transaction(() async {
      await _assertMonthOpen(accountingMonthId);
      await (delete(
        specialMealMembers,
      )..where((table) => table.specialMealId.equals(id))).go();
      await (delete(specialMeals)..where((table) => table.id.equals(id))).go();
    });
  }

  Future<void> _assertMonthOpen(String monthId) async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed') {
      throw StateError('Closed accounting months cannot be edited.');
    }
  }
}

@DriftAccessor(tables: [ExpenseCategories, Expenses, AccountingMonths])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<void> createCategory(ExpenseCategoriesCompanion category) {
    return into(expenseCategories).insert(category);
  }

  Future<void> createExpense(ExpensesCompanion expense) {
    return into(expenses).insert(expense);
  }

  Future<List<ExpenseCategory>> categoriesForMess(
    String messId, {
    bool activeOnly = false,
  }) {
    final query = select(expenseCategories)
      ..where((table) {
        var expression = table.messId.equals(messId);
        if (activeOnly) expression = expression & table.isActive.equals(true);
        return expression;
      })
      ..orderBy([
        (table) => OrderingTerm.asc(table.type),
        (table) => OrderingTerm.asc(table.sortOrder),
        (table) => OrderingTerm.asc(table.name),
      ]);
    return query.get();
  }

  Future<ExpenseCategory?> categoryById(String id) => (select(
    expenseCategories,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<void> saveCategory(ExpenseCategoriesCompanion category) =>
      into(expenseCategories).insertOnConflictUpdate(category);

  Future<List<Expense>> expensesForMonth(
    String accountingMonthId, {
    String query = '',
  }) {
    final normalized = query.trim().toLowerCase();
    final statement = select(expenses)
      ..where((table) {
        var expression = table.accountingMonthId.equals(accountingMonthId);
        if (normalized.isNotEmpty) {
          final pattern = '%$normalized%';
          expression =
              expression &
              (table.description.lower().like(pattern) |
                  table.vendor.lower().like(pattern));
        }
        return expression;
      })
      ..orderBy([(table) => OrderingTerm.desc(table.date)]);
    return statement.get();
  }

  Future<Expense?> expenseById(String id) => (select(
    expenses,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<void> saveExpenseForOpenMonth(ExpensesCompanion expense) {
    return transaction(() async {
      await _assertMonthOpen(expense.accountingMonthId.value);
      await into(expenses).insertOnConflictUpdate(expense);
    });
  }

  Future<void> deleteExpense(String id, String accountingMonthId) {
    return transaction(() async {
      await _assertMonthOpen(accountingMonthId);
      await (delete(expenses)..where((table) => table.id.equals(id))).go();
    });
  }

  Future<int> totalForMonth(String accountingMonthId) async {
    final total = expenses.amountMinor.sum();
    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(expenses.accountingMonthId.equals(accountingMonthId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<int> mealExpenseTotalForMonth(String accountingMonthId) async {
    final total = expenses.amountMinor.sum();
    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(
        expenses.accountingMonthId.equals(accountingMonthId) &
            expenses.affectsMealRate.equals(true),
      );
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<int> memberPaidTotalForMonth(String accountingMonthId) async {
    final total = expenses.amountMinor.sum();
    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(
        expenses.accountingMonthId.equals(accountingMonthId) &
            expenses.paidByMemberId.isNotNull(),
      );
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<void> _assertMonthOpen(String monthId) async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed') {
      throw StateError('Closed accounting months cannot be edited.');
    }
  }
}

@DriftAccessor(tables: [Deposits, AccountingMonths])
class DepositDao extends DatabaseAccessor<AppDatabase> with _$DepositDaoMixin {
  DepositDao(super.db);

  Future<void> create(DepositsCompanion deposit) =>
      into(deposits).insert(deposit);

  Future<List<Deposit>> depositsForMonth(String monthId) =>
      (select(deposits)
            ..where((table) => table.accountingMonthId.equals(monthId))
            ..orderBy([(table) => OrderingTerm.desc(table.date)]))
          .get();

  Future<List<Deposit>> depositsForMember(String memberId, String monthId) =>
      (select(deposits)
            ..where(
              (table) =>
                  table.memberId.equals(memberId) &
                  table.accountingMonthId.equals(monthId),
            )
            ..orderBy([(table) => OrderingTerm.desc(table.date)]))
          .get();

  Future<Deposit?> depositById(String id) => (select(
    deposits,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<void> saveForOpenMonth(DepositsCompanion deposit) =>
      transaction(() async {
        await _assertMonthOpen(deposit.accountingMonthId.value);
        await into(deposits).insertOnConflictUpdate(deposit);
      });

  Future<void> deleteForOpenMonth(String id, String monthId) =>
      transaction(() async {
        await _assertMonthOpen(monthId);
        await (delete(deposits)..where((table) => table.id.equals(id))).go();
      });

  Future<int> totalForMemberInMonth(
    String memberId,
    String accountingMonthId,
  ) async {
    final total = deposits.amountMinor.sum();
    final query = selectOnly(deposits)
      ..addColumns([total])
      ..where(
        deposits.memberId.equals(memberId) &
            deposits.accountingMonthId.equals(accountingMonthId),
      );
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<int> totalForMonth(String accountingMonthId) async {
    final total = deposits.amountMinor.sum();
    final query = selectOnly(deposits)
      ..addColumns([total])
      ..where(deposits.accountingMonthId.equals(accountingMonthId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<void> _assertMonthOpen(String monthId) async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed') {
      throw StateError('Closed accounting months cannot be edited.');
    }
  }
}

@DriftAccessor(tables: [UtilityBills, UtilityBillAllocations, AccountingMonths])
class UtilityDao extends DatabaseAccessor<AppDatabase> with _$UtilityDaoMixin {
  UtilityDao(super.db);

  Future<void> createBillWithAllocations(
    UtilityBillsCompanion bill,
    List<UtilityBillAllocationsCompanion> allocations,
  ) {
    return transaction(() async {
      await into(utilityBills).insert(bill);
      await batch(
        (batch) => batch.insertAll(utilityBillAllocations, allocations),
      );
    });
  }

  Future<int> allocatedTotal(String utilityBillId) async {
    final total = utilityBillAllocations.amountMinor.sum();
    final query = selectOnly(utilityBillAllocations)
      ..addColumns([total])
      ..where(utilityBillAllocations.utilityBillId.equals(utilityBillId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<int> totalForMonth(String accountingMonthId) async {
    final total = utilityBills.amountMinor.sum();
    final query = selectOnly(utilityBills)
      ..addColumns([total])
      ..where(utilityBills.accountingMonthId.equals(accountingMonthId));
    return (await query.getSingle()).read(total) ?? 0;
  }

  Future<List<UtilityBill>> billsForMonth(String monthId) =>
      (select(utilityBills)
            ..where((table) => table.accountingMonthId.equals(monthId))
            ..orderBy([(table) => OrderingTerm.desc(table.billingMonth)]))
          .get();

  Future<UtilityBill?> billById(String id) => (select(
    utilityBills,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<List<UtilityBillAllocation>> allocationsForBill(String billId) =>
      (select(
        utilityBillAllocations,
      )..where((table) => table.utilityBillId.equals(billId))).get();

  Future<void> saveBillForOpenMonth(
    UtilityBillsCompanion bill,
    List<UtilityBillAllocationsCompanion> allocations,
  ) => transaction(() async {
    await _assertMonthOpen(bill.accountingMonthId.value);
    await into(utilityBills).insertOnConflictUpdate(bill);
    await (delete(
      utilityBillAllocations,
    )..where((table) => table.utilityBillId.equals(bill.id.value))).go();
    await batch(
      (batch) => batch.insertAll(utilityBillAllocations, allocations),
    );
  });

  Future<void> markPaid(
    String billId,
    String monthId, {
    String? paidByMemberId,
    DateTime? paidDate,
  }) => transaction(() async {
    await _assertMonthOpen(monthId);
    await (update(
      utilityBills,
    )..where((table) => table.id.equals(billId))).write(
      UtilityBillsCompanion(
        status: const Value('paid'),
        paidByMemberId: Value(paidByMemberId),
        paidDate: Value(paidDate ?? DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  });

  Future<void> _assertMonthOpen(String monthId) async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed')
      throw StateError('Closed accounting months cannot be edited.');
  }
}

@DriftAccessor(tables: [MemberAdjustments, AccountingMonths])
class AdjustmentDao extends DatabaseAccessor<AppDatabase>
    with _$AdjustmentDaoMixin {
  AdjustmentDao(super.db);

  Future<List<MemberAdjustment>> adjustmentsForMonth(String monthId) =>
      (select(memberAdjustments)
            ..where((table) => table.accountingMonthId.equals(monthId))
            ..orderBy([(table) => OrderingTerm.desc(table.date)]))
          .get();

  Future<MemberAdjustment?> adjustmentById(String id) => (select(
    memberAdjustments,
  )..where((table) => table.id.equals(id))).getSingleOrNull();

  Future<void> saveForOpenMonth(MemberAdjustmentsCompanion adjustment) =>
      transaction(() async {
        await _assertMonthOpen(adjustment.accountingMonthId.value);
        await into(memberAdjustments).insertOnConflictUpdate(adjustment);
      });

  Future<void> deleteForOpenMonth(String id, String monthId) =>
      transaction(() async {
        await _assertMonthOpen(monthId);
        await (delete(
          memberAdjustments,
        )..where((table) => table.id.equals(id))).go();
      });

  Future<void> _assertMonthOpen(String monthId) async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed')
      throw StateError('Closed accounting months cannot be edited.');
  }
}

@DriftAccessor(
  tables: [Settlements, MemberSettlements, AccountingMonths, AuditEntries],
)
class SettlementDao extends DatabaseAccessor<AppDatabase>
    with _$SettlementDaoMixin {
  SettlementDao(super.db);

  Future<void> saveSnapshot(
    SettlementsCompanion settlement,
    List<MemberSettlementsCompanion> memberSnapshots,
  ) {
    return transaction(() async {
      await into(settlements).insert(settlement);
      await batch(
        (batch) => batch.insertAll(memberSettlements, memberSnapshots),
      );
    });
  }

  Future<Settlement?> forMonth(String accountingMonthId) {
    return (select(settlements)
          ..where((table) => table.accountingMonthId.equals(accountingMonthId)))
        .getSingleOrNull();
  }

  /// The snapshot insert and period freeze are deliberately one transaction.
  /// A failed member row, audit write, or month update rolls back everything.
  Future<void> closeMonthAtomically({
    required SettlementsCompanion settlement,
    required List<MemberSettlementsCompanion> memberSnapshots,
    required int finalMealRateScaled,
    required AuditEntriesCompanion audit,
  }) => transaction(() async {
    final monthId = settlement.accountingMonthId.value;
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null) throw StateError('Accounting month not found.');
    if (month.status == 'closed')
      throw StateError('Accounting month is already closed.');
    final prior = await forMonth(monthId);
    if (prior != null) {
      await (delete(
        memberSettlements,
      )..where((table) => table.settlementId.equals(prior.id))).go();
      await (delete(
        settlements,
      )..where((table) => table.id.equals(prior.id))).go();
    }
    await into(settlements).insert(settlement);
    await batch((batch) => batch.insertAll(memberSettlements, memberSnapshots));
    final now = DateTime.now();
    await (update(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).write(
      AccountingMonthsCompanion(
        status: const Value('closed'),
        endDate: Value(now),
        closedAt: Value(now),
        finalMealRateScaled: Value(finalMealRateScaled),
        updatedAt: Value(now),
      ),
    );
    await into(auditEntries).insert(audit);
  });

  /// The prior snapshot is retained until the next close attempt. The audit
  /// trail records that it is no longer the current calculation.
  Future<void> reopenMonth({
    required String messId,
    required String monthId,
    required String auditId,
  }) => transaction(() async {
    final month = await (select(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).getSingleOrNull();
    if (month == null || month.status != 'closed')
      throw StateError('Only a closed month can be reopened.');
    final now = DateTime.now();
    await (update(
      accountingMonths,
    )..where((table) => table.id.equals(monthId))).write(
      AccountingMonthsCompanion(
        status: const Value('active'),
        closedAt: const Value(null),
        finalMealRateScaled: const Value(null),
        updatedAt: Value(now),
      ),
    );
    await into(auditEntries).insert(
      AuditEntriesCompanion.insert(
        id: auditId,
        messId: messId,
        entityType: 'settlement',
        entityId: monthId,
        action: 'reopened',
        oldValueJson: const Value('{"status":"closed"}'),
        newValueJson: const Value(
          '{"status":"active","requiresRecalculation":true}',
        ),
      ),
    );
  });

  Future<void> replaceSnapshotForReclose({
    required String monthId,
    required SettlementsCompanion settlement,
    required List<MemberSettlementsCompanion> memberSnapshots,
  }) => transaction(() async {
    final existing = await forMonth(monthId);
    if (existing != null) {
      await (delete(
        memberSettlements,
      )..where((table) => table.settlementId.equals(existing.id))).go();
      await (delete(
        settlements,
      )..where((table) => table.id.equals(existing.id))).go();
    }
    await into(settlements).insert(settlement);
    await batch((batch) => batch.insertAll(memberSettlements, memberSnapshots));
  });
}

@DriftAccessor(
  tables: [AppSettings, Reminders, Attachments, AuditEntries, BackupMetadata],
)
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<void> saveSetting(AppSettingsCompanion setting) {
    return into(appSettings).insertOnConflictUpdate(setting);
  }

  Future<AppSetting?> findSetting(String messId, String key) {
    return (select(appSettings)..where(
          (table) => table.messId.equals(messId) & table.settingKey.equals(key),
        ))
        .getSingleOrNull();
  }

  Future<void> recordAudit(AuditEntriesCompanion entry) {
    return into(auditEntries).insert(entry);
  }
}
