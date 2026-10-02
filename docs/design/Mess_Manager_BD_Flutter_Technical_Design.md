# Mess Manager BD --- Flutter Technical Design Document

## 1. Document Purpose

This document defines the technical architecture for **Mess Manager
BD**, a production-grade mobile application for Bangladeshi
student/bachelor mess management.

The application is designed as a **local-first, offline application**.
All core functionality works without internet, without a backend, and
without user registration. One manager's device is the primary source of
truth.

The initial target is **Android and iOS using Flutter** from a shared
codebase.

------------------------------------------------------------------------

# 2. Technical Goals

The architecture should provide:

-   Fully offline operation
-   Reliable financial calculations
-   Fast daily meal entry
-   Safe local persistence
-   Transactional month-end settlement
-   Bangla and English localization
-   Local backup and restore
-   Export/share functionality
-   PIN and biometric protection
-   Local reminders
-   Clear separation of UI, business rules, and persistence
-   Strong automated testability
-   Safe database migrations
-   Maintainability as the product grows
-   No mandatory backend or cloud service

------------------------------------------------------------------------

# 3. Recommended Technology Stack

  -----------------------------------------------------------------------
  Area                                Technology
  ----------------------------------- -----------------------------------
  Mobile framework                    Flutter

  Language                            Dart

  Architecture                        Feature-first Clean Architecture

  State management                    Riverpod

  Local database                      Drift + SQLite

  Navigation                          go_router

  Immutable models                    Freezed

  JSON serialization                  json_serializable

  Dependency injection                Riverpod

  Localization                        Flutter `gen_l10n` / ARB

  Secure key/value storage            flutter_secure_storage

  Biometrics                          local_auth

  Notifications                       flutter_local_notifications

  File selection                      file_picker

  File system paths                   path_provider

  Sharing                             share_plus

  PDF generation                      pdf + printing

  CSV                                 csv

  Image picking                       image_picker

  Connectivity awareness              connectivity_plus, only where
                                      optional cloud features exist

  Logging                             logger or structured internal
                                      logging

  UUIDs                               uuid

  Date/time formatting                intl

  Money representation                integer minor units or fixed
                                      decimal abstraction

  Testing                             flutter_test, mocktail,
                                      integration_test
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 4. Why Drift + SQLite

SQLite is recommended because the application contains strongly
relational financial data:

-   Members
-   Accounting months
-   Meals
-   Expenses
-   Deposits
-   Bills
-   Adjustments
-   Settlements

The application requires:

-   Transactions
-   Foreign keys
-   Aggregations
-   Indexes
-   Reliable migrations
-   Complex reports
-   Relational integrity

**Drift** provides a type-safe Dart API over SQLite and works well with
Riverpod streams.

A document database such as Hive/Isar can work for simpler offline apps,
but SQLite/Drift is a stronger fit for this accounting-oriented domain.

------------------------------------------------------------------------

# 5. High-Level Architecture

``` text
┌──────────────────────────────────────────────┐
│                 Presentation                 │
│                                              │
│ Flutter Screens / Widgets                    │
│ Riverpod Providers / Notifiers               │
│ Form State / UI State                        │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│                   Domain                     │
│                                              │
│ Entities                                     │
│ Value Objects                                │
│ Repository Interfaces                        │
│ Use Cases                                    │
│ Financial Calculation Engine                 │
│ Settlement Engine                            │
│ Validation Rules                             │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│                    Data                      │
│                                              │
│ Repository Implementations                   │
│ Drift DAOs                                   │
│ SQLite Database                              │
│ Secure Storage                               │
│ File Storage                                 │
│ Backup / Restore                             │
└──────────────────────────────────────────────┘
```

The **Domain layer must not depend on Flutter or Drift**.

This allows financial rules to be tested independently.

------------------------------------------------------------------------

# 6. Feature-First Project Structure

``` text
lib/
├── app/
│   ├── app.dart
│   ├── bootstrap.dart
│   ├── router/
│   ├── theme/
│   └── localization/
│
├── core/
│   ├── database/
│   ├── errors/
│   ├── extensions/
│   ├── logging/
│   ├── money/
│   ├── security/
│   ├── storage/
│   ├── backup/
│   ├── notifications/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── onboarding/
│   ├── mess/
│   ├── members/
│   ├── meals/
│   ├── guest_meals/
│   ├── special_meals/
│   ├── expenses/
│   ├── utilities/
│   ├── deposits/
│   ├── adjustments/
│   ├── dashboard/
│   ├── settlements/
│   ├── reports/
│   ├── backup_restore/
│   └── settings/
│
└── main.dart
```

Each feature should preferably contain:

``` text
feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── controllers/
    ├── providers/
    ├── screens/
    └── widgets/
```

Avoid excessive abstraction for very small features. Clean Architecture
should improve maintainability, not create boilerplate for its own sake.

------------------------------------------------------------------------

# 7. Core Domain Model

Main entities:

``` text
Mess
Member
AccountingMonth
MealEntry
GuestMeal
SpecialMeal
Expense
ExpenseCategory
UtilityBill
Deposit
MemberAdjustment
Settlement
MemberSettlement
Attachment
Reminder
AppSettings
AuditEntry
BackupMetadata
```

------------------------------------------------------------------------

# 8. Database Design

## 8.1 messes

``` text
id
name
address
manager_name
manager_phone
currency_code
default_language
created_at
updated_at
```

Although MVP may support one mess, using `mess_id` from the beginning
makes multi-mess support easier later.

------------------------------------------------------------------------

## 8.2 members

``` text
id
mess_id
name
nickname
phone
room_number
avatar_path
join_date
leave_date
opening_balance_minor
status
notes
created_at
updated_at
```

Status:

``` text
active
inactive
left
```

------------------------------------------------------------------------

## 8.3 accounting_months

``` text
id
mess_id
year
month
start_date
end_date
status
final_meal_rate
closed_at
created_at
updated_at
```

Status:

``` text
active
draftSettlement
closed
```

Recommended constraint:

``` text
UNIQUE(mess_id, year, month)
```

------------------------------------------------------------------------

# 9. Meal Database Design

## 9.1 meal_entries

One record represents one member's meals for one date.

``` text
id
mess_id
accounting_month_id
member_id
meal_date
breakfast_units
lunch_units
dinner_units
extra_units
total_units
notes
created_at
updated_at
```

Recommended constraint:

``` text
UNIQUE(mess_id, member_id, meal_date)
```

Meal units should not use binary floating-point.

A useful implementation is scaled integer units:

``` text
0 meal   = 0
0.5 meal = 50
1 meal   = 100
1.5 meal = 150
```

This eliminates floating-point errors.

------------------------------------------------------------------------

# 10. Guest Meals

``` text
guest_meals

id
mess_id
accounting_month_id
host_member_id
meal_date
guest_name
guest_count
meal_units
charge_method
direct_charge_minor
notes
created_at
updated_at
```

Charge methods:

``` text
addToHostMeal
directCharge
generalMess
```

------------------------------------------------------------------------

# 11. Special Meals

``` text
special_meals

id
mess_id
accounting_month_id
date
title
total_cost_minor
distribution_method
notes
created_at
updated_at
```

Participants should use a junction table:

``` text
special_meal_members

id
special_meal_id
member_id
share_amount_minor
```

------------------------------------------------------------------------

# 12. Expense Model

## 12.1 expense_categories

``` text
id
mess_id
name
name_bn
type
is_system
is_active
sort_order
```

Type:

``` text
mealExpense
sharedExpense
other
```

------------------------------------------------------------------------

## 12.2 expenses

``` text
id
mess_id
accounting_month_id
date
category_id
amount_minor
description
vendor
paid_by_member_id
payment_source
affects_meal_rate
distribution_method
receipt_path
notes
created_at
updated_at
```

The critical field is:

``` text
affects_meal_rate
```

Example:

``` text
Rice        → true
Vegetables  → true
Fish        → true
Wi-Fi       → false
Electricity → false
Maid salary → false
```

This prevents non-food expenses from incorrectly increasing the meal
rate.

------------------------------------------------------------------------

# 13. Utility Bills

``` text
utility_bills

id
mess_id
accounting_month_id
bill_type
amount_minor
billing_month
due_date
paid_date
status
paid_by_member_id
distribution_method
receipt_path
notes
created_at
updated_at
```

A distribution table should store the actual allocation:

``` text
utility_bill_allocations

id
utility_bill_id
member_id
amount_minor
```

Never rely solely on recalculating historical allocation rules after a
month closes.

------------------------------------------------------------------------

# 14. Deposits

``` text
deposits

id
mess_id
accounting_month_id
member_id
date
amount_minor
payment_method
reference
notes
created_at
updated_at
```

Payment methods:

``` text
cash
bkash
nagad
rocket
bank
other
```

These values represent bookkeeping records, not payment integrations.

------------------------------------------------------------------------

# 15. Member Adjustments

``` text
member_adjustments

id
mess_id
accounting_month_id
member_id
date
type
direction
amount_minor
reason
notes
created_at
updated_at
```

Direction:

``` text
debit
credit
```

Types may include:

``` text
previousBalance
refund
fine
discount
damage
advance
correction
other
```

------------------------------------------------------------------------

# 16. Money Representation

Never store money using Dart `double` or SQLite `REAL`.

Recommended approach:

``` text
৳69.74
```

stored as:

``` text
6974
```

where the stored integer represents paisa.

Create a domain value object:

``` dart
Money
```

Conceptually:

``` text
Money {
  int minorUnits;
  String currency;
}
```

All addition, subtraction, allocation, comparison, and settlement
operations should operate on integer minor units.

This is especially important for month-end reconciliation.

------------------------------------------------------------------------

# 17. Meal Rate Engine

Meal rate:

``` text
Total Meal Expense
------------------
Total Meal Units
```

Internally, calculate with sufficient precision and apply a single
documented rounding policy.

Example:

``` text
Total expense = ৳58,720
Total meals   = 842

Meal rate = ৳69.7387...
Displayed rate = ৳69.74
```

Do not repeatedly round intermediate calculations.

Recommended flow:

1.  Sum eligible meal expenses.
2.  Sum meal units.
3.  Calculate high-precision rate.
4.  Calculate each member's meal cost.
5.  Allocate rounding remainder deterministically if necessary.
6.  Verify total allocated member meal cost equals intended meal expense
    total.

------------------------------------------------------------------------

# 18. Settlement Calculation Engine

Create a dedicated pure-Dart service:

``` text
SettlementCalculator
```

It should have no UI or database dependencies.

Conceptual input:

``` text
SettlementInput
 ├── members
 ├── meal entries
 ├── guest meals
 ├── meal expenses
 ├── shared expenses
 ├── utility allocations
 ├── deposits
 ├── member-paid expenses
 ├── special meals
 ├── adjustments
 └── previous balances
```

Output:

``` text
SettlementResult
 ├── totalMeals
 ├── totalMealExpense
 ├── mealRate
 ├── totalDeposits
 ├── totalOtherExpenses
 ├── memberResults[]
 └── reconciliation
```

------------------------------------------------------------------------

# 19. Member Settlement Formula

Conceptually:

``` text
Meal Cost
+ Guest/Special Meal Charges
+ Utility Share
+ Shared Expense Share
+ Debit Adjustments
+ Previous Amount Owed

= Gross Payable

Deposits
+ Expenses Paid Personally
+ Credit Adjustments
+ Previous Credit

= Total Credit

Final Balance = Total Credit - Gross Payable
```

Interpretation:

``` text
Final Balance > 0
→ Mess owes member

Final Balance < 0
→ Member owes mess

Final Balance = 0
→ Settled
```

The UI should use these descriptions rather than depending only on +/-
signs.

------------------------------------------------------------------------

# 20. Settlement Snapshot Design

When a month is closed, calculated values must be persisted.

## settlements

``` text
id
mess_id
accounting_month_id
total_meal_units
total_meal_expense_minor
meal_rate_scaled
total_shared_expense_minor
total_deposit_minor
created_at
closed_at
```

## member_settlements

``` text
id
settlement_id
member_id
meal_units
meal_cost_minor
guest_charge_minor
special_meal_charge_minor
utility_share_minor
shared_expense_share_minor
adjustment_debit_minor
adjustment_credit_minor
previous_balance_minor
deposit_minor
member_paid_expense_minor
total_payable_minor
total_credit_minor
final_balance_minor
```

The snapshot protects historical reports from future configuration
changes.

------------------------------------------------------------------------

# 21. Month Closing Workflow

``` text
Active Month
     │
     ▼
Validate Records
     │
     ▼
Calculate Draft Settlement
     │
     ▼
Reconciliation Check
     │
     ▼
Manager Review
     │
     ▼
Close Month Transaction
     │
     ├── Save settlement
     ├── Save member settlement snapshots
     ├── Freeze final meal rate
     └── Mark month closed
     │
     ▼
Prepare Next Month
     │
     └── Carry balances forward
```

The database operations involved in closing a month should execute
inside a single SQLite transaction.

------------------------------------------------------------------------

# 22. Reconciliation Rules

Settlement must expose internal reconciliation.

Example:

``` text
Total meal expense:
৳58,720.00

Allocated member meal cost:
৳58,720.00

Difference:
৳0.00
```

Also validate:

``` text
Total utility bills
=
Total member utility allocations
```

and:

``` text
Total special meal cost
=
Total special meal allocations
```

A month should not close when unexplained reconciliation differences
exist.

------------------------------------------------------------------------

# 23. Riverpod State Management

Use Riverpod for:

-   Dependency injection
-   Repository providers
-   Database providers
-   Reactive queries
-   Screen state
-   Form controllers
-   Async operations

Example conceptual provider graph:

``` text
databaseProvider
      │
      ├── memberRepositoryProvider
      ├── mealRepositoryProvider
      ├── expenseRepositoryProvider
      └── settlementRepositoryProvider
                  │
                  ▼
          useCase providers
                  │
                  ▼
          controller providers
                  │
                  ▼
                UI
```

Prefer:

-   `Provider`
-   `FutureProvider`
-   `StreamProvider`
-   `Notifier`
-   `AsyncNotifier`

Avoid storing domain truth inside widgets.

------------------------------------------------------------------------

# 24. Repository Pattern

Domain repository interfaces:

``` text
MemberRepository
MealRepository
ExpenseRepository
DepositRepository
UtilityRepository
SettlementRepository
BackupRepository
SettingsRepository
```

Example conceptual API:

``` text
MemberRepository
 ├── watchActiveMembers()
 ├── getMember(id)
 ├── addMember()
 ├── updateMember()
 └── deactivateMember()
```

Data-layer implementations use Drift DAOs.

------------------------------------------------------------------------

# 25. Use Cases

Examples:

``` text
CreateMess
AddMember
UpdateMember
RecordDailyMeals
CopyPreviousDayMeals
RecordGuestMeal
AddExpense
AddDeposit
AddUtilityBill
CalculateCurrentMealRate
GetMemberCurrentBalance
GenerateDraftSettlement
CloseAccountingMonth
ReopenAccountingMonth
CreateBackup
RestoreBackup
GenerateMemberStatement
```

Complex business operations belong in use cases/domain services rather
than widgets.

------------------------------------------------------------------------

# 26. Dashboard Query Strategy

Avoid loading all records into Dart and calculating dashboard totals in
memory.

Use optimized SQL aggregate queries.

Example:

``` text
SUM(meal units)
SUM(meal expenses)
SUM(deposits)
COUNT(active members)
```

Drift can expose reactive streams so the dashboard updates automatically
after records change.

------------------------------------------------------------------------

# 27. Database Indexes

Important indexes include:

``` text
members(mess_id, status)

meal_entries(accounting_month_id)
meal_entries(member_id, meal_date)
meal_entries(meal_date)

expenses(accounting_month_id)
expenses(date)
expenses(category_id)

deposits(accounting_month_id)
deposits(member_id, date)

utility_bills(accounting_month_id)

member_adjustments(member_id, accounting_month_id)
```

Indexes should be validated against actual query patterns.

------------------------------------------------------------------------

# 28. Database Transactions

Use transactions for operations such as:

-   Saving the entire daily meal sheet
-   Deleting records with dependent allocations
-   Creating utility allocations
-   Closing a month
-   Reopening a month
-   Restoring backup data
-   Carrying balances forward

Partial financial writes must be avoided.

------------------------------------------------------------------------

# 29. Soft Delete vs Hard Delete

For financial records, prefer either:

-   controlled hard deletion while the month is open, with audit
    history; or
-   soft deletion for records where traceability is important.

Closed-month records should not be directly deleted.

Reopening the month should be required first.

------------------------------------------------------------------------

# 30. Local Audit Log

Recommended table:

``` text
audit_entries

id
mess_id
entity_type
entity_id
action
old_value_json
new_value_json
timestamp
```

Actions:

``` text
create
update
delete
closeMonth
reopenMonth
restoreBackup
```

This is useful even on a single-user application because accidental
edits are common in financial bookkeeping.

------------------------------------------------------------------------

# 31. Local File Storage

SQLite should store structured data.

Files such as:

-   Expense receipts
-   Utility receipts
-   Member photos
-   Generated reports

should live in application storage.

SQLite stores only:

``` text
relative file path
metadata
```

Do not store large images as database BLOBs unless there is a strong
reason.

------------------------------------------------------------------------

# 32. Receipt Image Handling

Recommended process:

``` text
Select/capture image
      ↓
Validate type
      ↓
Resize if necessary
      ↓
Compress
      ↓
Generate UUID filename
      ↓
Save to app storage
      ↓
Save relative path in SQLite
```

Remove orphaned files when their owning record is permanently deleted.

------------------------------------------------------------------------

# 33. Backup Architecture

A backup should include:

``` text
backup/
├── manifest.json
├── database.sqlite
└── attachments/
    ├── receipts/
    └── avatars/
```

Package these into a single application-specific archive.

Example:

``` text
mess_manager_bd_2026_10_31.mmbd
```

------------------------------------------------------------------------

# 34. Backup Manifest

Example conceptual metadata:

``` json
{
  "formatVersion": 1,
  "appVersion": "1.0.0",
  "databaseVersion": 5,
  "createdAt": "2026-10-31T21:30:00+06:00",
  "messCount": 1
}
```

The restore service should validate compatibility before replacing
current data.

------------------------------------------------------------------------

# 35. Safe Restore Flow

``` text
Select backup
     ↓
Read manifest
     ↓
Validate file
     ↓
Validate backup version
     ↓
Create safety backup of current data
     ↓
Restore into temporary location
     ↓
Run integrity checks
     ↓
Replace active database/files
     ↓
Restart/reload repositories
```

Never overwrite the active database immediately after file selection.

------------------------------------------------------------------------

# 36. Backup Security

Advanced versions should support encrypted backup archives.

Possible design:

-   AES-256 authenticated encryption
-   Key derived from user backup password
-   Random salt
-   Modern KDF
-   Integrity/authentication verification

Do not invent custom cryptography.

For MVP, device-local storage plus app security can be used while
encrypted portable backups are developed and thoroughly tested.

------------------------------------------------------------------------

# 37. Optional Cloud Backup

Future versions may support:

``` text
Google Drive
OneDrive
Dropbox
```

Architecture:

``` text
Local Backup Engine
        │
        ▼
Backup File
        │
        ├── Local Storage
        ├── Share Sheet
        └── Cloud Storage Adapter
```

Cloud providers should only transport encrypted backup files.

The local SQLite database remains the application's primary database.

No custom backend is required.

------------------------------------------------------------------------

# 38. Authentication and Local Security

Because no online account exists, authentication means protecting local
app access.

Support:

-   Manager PIN
-   Biometric authentication
-   Auto-lock
-   Secure PIN metadata storage
-   Optional biometric fallback to PIN

Use:

``` text
flutter_secure_storage
local_auth
```

Never store a plaintext PIN.

------------------------------------------------------------------------

# 39. Sensitive Action Confirmation

Require additional confirmation for:

-   Restore backup
-   Delete all data
-   Reopen closed month
-   Reset application
-   Permanently delete important financial records

Optional biometric/PIN re-verification can be used for destructive
operations.

------------------------------------------------------------------------

# 40. Navigation

Use `go_router`.

Suggested navigation shell:

``` text
Dashboard
Meals
Expenses
Members
More
```

More:

``` text
Deposits
Utility Bills
Settlement
Reports
Backup & Restore
Settings
```

Deep routes:

``` text
/member/:id
/member/:id/history
/expense/:id
/month/:id/settlement
/month/:id/report
```

------------------------------------------------------------------------

# 41. Localization

Use Flutter ARB localization.

Example:

``` text
lib/l10n/
├── app_en.arb
└── app_bn.arb
```

Do not hardcode Bangla/English strings inside widgets.

Support:

``` text
English
বাংলা
```

The language preference should be stored locally and applied without
requiring a restart.

------------------------------------------------------------------------

# 42. Bangladesh Formatting

Create formatting utilities for:

-   BDT currency
-   ৳ symbol
-   Bangla/English number display
-   Local date formatting
-   Payment method labels
-   Mess-specific terminology

Example:

``` text
৳58,720.00
```

Bangla UI:

``` text
মোট বাজার
মিল রেট
জমা
বাকি
```

------------------------------------------------------------------------

# 43. Theme System

Support:

-   Light theme
-   Dark theme
-   System theme

Use Material 3.

Create semantic design tokens rather than hardcoding styling repeatedly:

``` text
spacing
radius
typography
surface hierarchy
success
warning
error
balance states
```

Financial meaning should not depend only on color; include text/icons
for accessibility.

------------------------------------------------------------------------

# 44. Local Notifications

Use:

``` text
flutter_local_notifications
```

Examples:

-   Daily meal entry reminder
-   Utility due reminder
-   Deposit reminder
-   Month closing reminder
-   Backup reminder

Notifications should be scheduled locally.

No push-notification server is required.

------------------------------------------------------------------------

# 45. Report Generation

Reports should be generated from local database data.

Supported output:

``` text
PDF
CSV
Text
Image summary
```

Important reports:

-   Monthly settlement
-   Member statement
-   Meal report
-   Expense report
-   Deposit report
-   Utility report

Use `printing` for PDF preview/share/print where appropriate.

------------------------------------------------------------------------

# 46. Share Architecture

Use the operating system share sheet.

Example:

``` text
Generate report
      ↓
Write temporary file
      ↓
Open native share sheet
      ↓
Messenger / WhatsApp / Email / Drive / etc.
```

The app does not need direct integrations with messaging applications.

------------------------------------------------------------------------

# 47. Error Handling

Create typed application failures.

Examples:

``` text
DatabaseFailure
ValidationFailure
BackupFailure
RestoreFailure
FileFailure
SettlementFailure
SecurityFailure
NotificationFailure
```

Repository implementations translate infrastructure exceptions into
application failures.

UI translates failures into localized, user-friendly messages.

------------------------------------------------------------------------

# 48. Logging

Production logging should:

-   Avoid exposing PIN/security information
-   Avoid dumping entire financial datasets
-   Record technical failures
-   Record database migration failures
-   Record backup/restore failures
-   Support debug logs in development

Consider a local diagnostic export that users can explicitly generate
for support in future releases.

------------------------------------------------------------------------

# 49. Database Migration Strategy

Every schema change must increment the database version.

Example:

``` text
v1 → initial schema
v2 → guest meal enhancements
v3 → attachments
v4 → audit history
```

Each migration should have automated tests.

Never depend on uninstall/reinstall during production upgrades.

------------------------------------------------------------------------

# 50. App Initialization

Recommended startup sequence:

``` text
Flutter binding
      ↓
Initialize logging
      ↓
Resolve app directories
      ↓
Open secure storage
      ↓
Open/migrate database
      ↓
Initialize settings
      ↓
Initialize notifications
      ↓
Check app lock
      ↓
Launch application
```

Failures should lead to a recoverable error screen rather than a
permanent splash screen.

------------------------------------------------------------------------

# 51. Performance Requirements

Target typical mess sizes:

``` text
Members:             5–100
Meals/month:         thousands of rows
Expenses/month:      hundreds
History:             multiple years
Attachments:         hundreds/thousands
```

This is well within SQLite capability.

Performance guidelines:

-   Paginate long histories
-   Index query columns
-   Use SQL aggregates
-   Avoid unnecessary provider rebuilds
-   Compress receipt images
-   Avoid reading attachment bytes until required

------------------------------------------------------------------------

# 52. Testing Strategy

## Unit Tests

Highest priority:

``` text
Meal rate calculations
Member balances
Shared expense distribution
Utility distribution
Guest meal rules
Special meal allocation
Rounding
Carry-forward
Settlement reconciliation
```

Financial domain code should have very high test coverage.

------------------------------------------------------------------------

# 53. Calculation Test Cases

Examples:

``` text
No meals in month
One member
Fractional meals
Guest meals
Member joins mid-month
Member leaves mid-month
Member pays বাজার personally
Over-deposit
Under-deposit
Previous credit
Previous due
Utility excluded for a member
Odd amount equally divided
Rounding remainder
Zero meal expense
Month reopened
```

Property/invariant tests are valuable for settlement logic.

Example invariant:

``` text
Sum(member allocated meal cost)
=
Total allocated meal expense
```

------------------------------------------------------------------------

# 54. Repository Tests

Test:

-   CRUD
-   Filters
-   Joins
-   Aggregate queries
-   Transactions
-   Foreign keys
-   Unique constraints
-   Closed-month protections

Use an isolated test SQLite database.

------------------------------------------------------------------------

# 55. Widget Tests

Prioritize:

-   Daily meal entry
-   Add expense
-   Add deposit
-   Dashboard
-   Member balance
-   Settlement review
-   Backup/restore confirmation

Test both:

``` text
English
বাংলা
```

and common small-screen layouts.

------------------------------------------------------------------------

# 56. Integration Tests

Critical flows:

### Flow A

``` text
Create mess
→ Add members
→ Add meals
→ Add বাজার
→ Add deposits
→ View meal rate
```

### Flow B

``` text
Complete month
→ Generate settlement
→ Verify balances
→ Close month
→ Start next month
```

### Flow C

``` text
Create backup
→ Reset test database
→ Restore backup
→ Verify financial totals
```

------------------------------------------------------------------------

# 57. CI/CD

Recommended pipeline:

``` text
Format check
      ↓
Static analysis
      ↓
Unit tests
      ↓
Widget tests
      ↓
Database migration tests
      ↓
Build Android
      ↓
Build iOS
```

Commands should include:

``` text
dart format
flutter analyze
flutter test
```

Production signing secrets must remain outside source control.

------------------------------------------------------------------------

# 58. Environment Configuration

Because the MVP has no backend, environment configuration remains small.

Possible flavors:

``` text
development
staging
production
```

Useful differences:

-   Logging level
-   Demo/sample data
-   Debug tools
-   Backup diagnostics

Do not add environment complexity without a concrete need.

------------------------------------------------------------------------

# 59. Security Considerations

Protect against:

-   Plaintext PIN storage
-   Path traversal during backup extraction
-   Malformed backup archives
-   Database corruption
-   Accidental destructive actions
-   Sensitive data in logs
-   Unsafe temporary files
-   Backup downgrade incompatibility

On supported platforms, use OS-level application sandboxing and secure
storage.

------------------------------------------------------------------------

# 60. Data Integrity Rules

Examples:

``` text
Meal units >= 0
Expense amount > 0
Deposit amount > 0
Member must belong to current mess
Transaction month must match accounting period
Closed months reject ordinary modifications
Allocation totals must reconcile
Deleted member cannot erase historical records
```

Implement critical rules both in domain validation and database
constraints where appropriate.

------------------------------------------------------------------------

# 61. Offline-First Principle

Core features must never check internet connectivity.

These features must work in airplane mode:

``` text
Members
Meals
Expenses
Deposits
Utilities
Dashboard
Meal rate
Settlement
Reports
Local backup
Local notifications
```

Internet becomes relevant only for optional future cloud backup.

------------------------------------------------------------------------

# 62. Suggested Flutter Packages

A representative dependency set:

``` yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod:
  riverpod_annotation:
  go_router:

  drift:
  sqlite3_flutter_libs:
  path_provider:
  path:

  freezed_annotation:
  json_annotation:

  intl:
  uuid:

  flutter_secure_storage:
  local_auth:

  flutter_local_notifications:

  file_picker:
  image_picker:
  share_plus:

  pdf:
  printing:
  csv:

dev_dependencies:
  flutter_test:
    sdk: flutter

  build_runner:
  riverpod_generator:
  drift_dev:
  freezed:
  json_serializable:
  mocktail:
```

Pin compatible versions when implementation begins rather than copying
unverified version numbers into the architecture document.

------------------------------------------------------------------------

# 63. MVP Module Boundaries

Recommended MVP implementation order:

``` text
Foundation
   ↓
Mess Setup
   ↓
Members
   ↓
Meals
   ↓
Expenses
   ↓
Deposits
   ↓
Utilities
   ↓
Calculation Engine
   ↓
Dashboard
   ↓
Settlement
   ↓
Reports
   ↓
Backup/Restore
   ↓
Security
   ↓
Notifications
   ↓
Production Hardening
```

------------------------------------------------------------------------

# 64. Future Architecture Extensions

The architecture should permit future modules without redesigning core
accounting.

Potential extensions:

-   Multiple messes
-   Scheduled meal-off
-   Cloud backup adapters
-   Budgeting
-   Advanced analytics
-   Receipt OCR
-   Home-screen widgets
-   Member read-only report export
-   Local smart insights
-   Encrypted portable backup
-   Import from spreadsheet
-   Mess migration between devices

A future multi-device collaborative version would fundamentally
introduce synchronization/conflict concerns and should be treated as a
separate architecture phase rather than quietly added to the offline
MVP.

------------------------------------------------------------------------

# 65. Recommended Architectural Decisions Summary

  Decision                 Recommendation
  ------------------------ ----------------------------------
  Framework                Flutter
  Platforms                Android + iOS
  Backend                  None for MVP
  Primary storage          SQLite
  SQLite abstraction       Drift
  State management         Riverpod
  Architecture             Feature-first Clean Architecture
  Navigation               go_router
  Models                   Freezed
  Money                    Integer minor units
  Meal quantity            Scaled integer units
  Financial calculations   Pure Dart domain engine
  Settlement history       Immutable snapshot on close
  Backup                   Database + attachments archive
  Security                 PIN + biometrics
  Localization             ARB / gen_l10n
  Notifications            Local notifications
  Reports                  Local PDF/CSV/text
  Cloud                    Optional backup transport only

------------------------------------------------------------------------

# 66. Most Important Engineering Rule

The most important part of Mess Manager BD is not the UI---it is
**accounting correctness**.

The implementation should therefore keep this dependency direction:

``` text
UI
 ↓
Application / Use Cases
 ↓
Domain Rules
 ↓
Repository Interfaces

Infrastructure implements those interfaces.
```

Meal-rate calculation, expense allocation, balance calculation,
rounding, carry-forward, and month closing should be implemented as
deterministic pure-Dart business logic with comprehensive automated
tests.

If these rules are correct and independently tested, the Flutter UI can
evolve without risking the integrity of users' monthly mess accounts.
