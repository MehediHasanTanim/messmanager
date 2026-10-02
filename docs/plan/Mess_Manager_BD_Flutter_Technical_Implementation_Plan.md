# Mess Manager BD --- Flutter Technical Implementation Plan

## 1. Purpose

This document defines the phase-wise and sprint-wise technical
implementation plan for **Mess Manager BD**, a production-grade Flutter
mobile application for managing meals, বাজার expenses, deposits, utility
bills, member balances, and monthly settlement for Bangladeshi
student/bachelor messes.

The plan is based on the approved product scope, Flutter technical
design, and the 170-screen/state UI specification.

------------------------------------------------------------------------

# 2. Target Architecture

## Mobile

-   Flutter
-   Dart
-   Android + iOS

## Architecture

-   Feature-first Clean Architecture
-   Presentation
-   Application / Use Cases
-   Domain
-   Data / Infrastructure

## Core Libraries

-   Riverpod
-   Drift + SQLite
-   go_router
-   Freezed
-   json_serializable
-   flutter_secure_storage
-   local_auth
-   flutter_local_notifications
-   path_provider
-   file_picker
-   image_picker
-   share_plus
-   pdf
-   printing
-   csv
-   intl
-   uuid

## Core Engineering Principles

1.  Offline-first
2.  No backend dependency
3.  SQLite is the primary source of truth
4.  Financial calculations use deterministic pure-Dart logic
5.  Money is never stored using floating-point values
6.  Closed accounting months use immutable settlement snapshots
7.  Database migrations are tested
8.  Backup restore is verified before replacing live data
9.  Bangla and English are first-class languages
10. Core accounting works without internet or external services

------------------------------------------------------------------------

# 3. Delivery Model

Recommended planning unit:

-   2-week sprint
-   Approximately 14--16 implementation sprints
-   Followed by release hardening

A smaller team can execute the same phases sequentially over a longer
calendar period.

Suggested workstreams:

-   Flutter foundation/UI
-   Domain/accounting
-   Database/data
-   Platform/security
-   QA/automation

For a single developer, preserve the same dependency order.

------------------------------------------------------------------------

# 4. Phase Overview

  Phase      Focus
  ---------- ------------------------------------------
  Phase 0    Project preparation
  Phase 1    Flutter foundation
  Phase 2    Local database and domain foundation
  Phase 3    Setup, localization and security
  Phase 4    Members and accounting periods
  Phase 5    Daily meals
  Phase 6    Guest and special meals
  Phase 7    Expenses and বাজার
  Phase 8    Utilities, deposits and adjustments
  Phase 9    Calculation engine and dashboard
  Phase 10   Settlement and month closing
  Phase 11   Reports and sharing
  Phase 12   Backup and restore
  Phase 13   Reminders, settings and audit
  Phase 14   UX states, accessibility and performance
  Phase 15   Production hardening
  Phase 16   Store release

------------------------------------------------------------------------

# 5. Phase 0 --- Project Preparation

## Objective

Finalize engineering conventions before feature implementation begins.

## Tasks

### Repository

-   Create Git repository.
-   Define branch strategy.
-   Configure `.gitignore`.
-   Add README.
-   Add contribution conventions.
-   Add architecture overview.
-   Add build/run instructions.

### Flutter SDK

-   Select stable Flutter version.
-   Lock Dart SDK compatibility.
-   Configure Android SDK.
-   Configure Xcode/iOS build.
-   Verify physical Android device.
-   Verify iPhone simulator/device.

### Application Identity

Define:

``` text
Android applicationId
iOS bundleIdentifier
App display name
Version strategy
Build number strategy
```

### Environments

Prepare:

``` text
development
production
```

Optional staging flavor can be added later.

### Engineering Standards

Configure:

-   Dart formatter
-   Flutter lints
-   analysis_options.yaml
-   Naming conventions
-   Folder conventions
-   Import rules
-   Commit conventions

### Definition of Done

Every feature should require:

-   Implementation
-   Localization
-   Validation
-   Unit/widget tests where appropriate
-   Error handling
-   Empty/loading states
-   Accessibility review
-   Android verification
-   iOS verification

## Deliverables

-   Buildable Flutter project
-   Repository conventions
-   Architecture baseline
-   CI-ready source tree

------------------------------------------------------------------------

# 6. Phase 1 --- Flutter Application Foundation

## Objective

Build the reusable application shell and foundational infrastructure.

## Sprint 1

### Project Structure

Create:

``` text
lib/
├── app/
├── core/
├── features/
└── l10n/
```

Prepare feature template:

``` text
feature/
├── data/
├── domain/
└── presentation/
```

### Riverpod

-   Add Riverpod dependencies.
-   Configure generated providers if used.
-   Create provider conventions.
-   Create app-level providers.
-   Configure ProviderScope.
-   Add debug observer if useful.

### Routing

Implement `go_router`.

Create route groups:

-   Setup
-   Lock
-   Home
-   Members
-   Meals
-   Expenses
-   Settlement
-   Reports
-   Settings

Add:

-   Redirect logic
-   Unknown route handling
-   Deep route parameter conventions

### Theme

Implement Material 3 design system.

Create tokens for:

-   Spacing
-   Radius
-   Typography
-   Elevation
-   Semantic colors
-   Success
-   Warning
-   Error
-   Balance states

Implement:

-   Light theme
-   Dark theme
-   System theme

### Shared Widgets

Initial reusable components:

-   App scaffold
-   Primary button
-   Secondary button
-   Destructive button
-   App text field
-   Amount input
-   Search field
-   Empty state
-   Error state
-   Loading state
-   Section header
-   Summary card
-   Status badge
-   Member avatar
-   Confirmation sheet

### Logging

Create structured logging abstraction.

Rules:

-   No PIN logging
-   No full financial database dumps
-   Production log reduction
-   Debug logs enabled in development

## Acceptance Criteria

-   App launches on Android/iOS.
-   Theme switching works.
-   Router works.
-   Riverpod foundation works.
-   Shared components have widget tests.

------------------------------------------------------------------------

# 7. Phase 2 --- Database and Domain Foundation

## Objective

Establish the application's most important technical foundation before
feature screens expand.

## Sprint 2

### Drift Setup

Add:

-   drift
-   drift_dev
-   sqlite3_flutter_libs
-   path_provider
-   path

Create:

``` text
AppDatabase
DatabaseProvider
MigrationStrategy
```

### Core Tables

Implement initial Drift tables:

-   Messes
-   Members
-   AccountingMonths
-   MealEntries
-   GuestMeals
-   SpecialMeals
-   SpecialMealMembers
-   ExpenseCategories
-   Expenses
-   UtilityBills
-   UtilityBillAllocations
-   Deposits
-   MemberAdjustments
-   Settlements
-   MemberSettlements
-   Attachments
-   Reminders
-   AppSettings
-   AuditEntries
-   BackupMetadata

### Constraints

Add:

-   Primary keys
-   Foreign keys
-   Unique constraints
-   Required indexes
-   Check constraints where practical

Examples:

``` text
UNIQUE(mess_id, year, month)
UNIQUE(mess_id, member_id, meal_date)
meal units >= 0
amount > 0
```

### Database Versioning

Create:

``` text
schemaVersion = 1
```

Build migration infrastructure immediately.

### DAOs

Initial DAOs:

-   MessDao
-   MemberDao
-   AccountingMonthDao
-   MealDao
-   ExpenseDao
-   DepositDao
-   UtilityDao
-   SettlementDao
-   SettingsDao

### Core Value Objects

Implement pure Dart:

``` text
Money
MealUnits
AccountingPeriod
MemberBalance
```

Money:

``` text
int minorUnits
```

Meal units:

``` text
scaled integer
100 = 1 meal
50 = 0.5 meal
```

### Failure Model

Create:

-   AppFailure
-   DatabaseFailure
-   ValidationFailure
-   FileFailure
-   SecurityFailure
-   SettlementFailure

### Repository Contracts

Create domain interfaces:

-   MessRepository
-   MemberRepository
-   AccountingMonthRepository
-   MealRepository
-   ExpenseRepository
-   DepositRepository
-   UtilityRepository
-   SettlementRepository
-   SettingsRepository
-   BackupRepository

### Tests

Test:

-   Table creation
-   Constraints
-   Foreign keys
-   DAO CRUD
-   Transactions
-   Aggregate queries
-   Unique meal entries
-   Money arithmetic
-   MealUnits arithmetic

## Release Gate

Do not begin settlement implementation until database/domain tests are
stable.

------------------------------------------------------------------------

# 8. Phase 3 --- Localization, Setup and Security

## Sprint 3

## Objective

Implement screens 1--12 and establish application onboarding.

### Localization

Configure Flutter ARB:

``` text
app_en.arb
app_bn.arb
```

Implement:

-   Runtime language switching
-   English
-   বাংলা
-   Localized validation
-   Localized date formatting
-   Localized financial labels

Create terminology constants for:

-   Meal
-   বাজার
-   Deposit
-   Due
-   Settlement
-   Utility
-   Balance

### Splash

Implement:

1.  Splash / Initialization

Startup orchestration:

-   Open database
-   Run migrations
-   Load settings
-   Check onboarding
-   Check app lock
-   Route appropriately

### Setup Flow

Implement:

2.  Language Selection
3.  Welcome
4.  Create Mess
5.  Manager Setup
6.  Initial Accounting Month
7.  Setup Complete

### Use Cases

Create:

-   CreateMess
-   UpdateMess
-   CreateInitialAccountingMonth
-   CompleteOnboarding

### PIN Security

Implement:

8.  Create PIN
9.  Confirm PIN
10. App Lock
11. Recovery Guidance

Use:

``` text
flutter_secure_storage
```

Store:

-   Salt/hash or secure credential representation
-   Security settings

Never store plaintext PIN.

### Biometrics

Implement:

10. Biometric Setup

Using:

``` text
local_auth
```

Handle:

-   Available
-   Not available
-   Enrollment missing
-   Permission/platform failure
-   PIN fallback

### Tests

-   Setup routing
-   Fresh install
-   Existing setup
-   Language switching
-   PIN validation
-   PIN mismatch
-   App lock
-   Biometric fallback

------------------------------------------------------------------------

# 9. Phase 4 --- Accounting Month and Member Management

## Sprint 4

## Objective

Implement screens 13--34.

### Application Shell

Implement:

13. Main App Shell

Bottom navigation:

-   Home
-   Meals
-   Expenses
-   Members
-   More

### Accounting Months

Implement:

14. Month Selector
15. Month Details
16. Start New Month
17. Closed Month View

Use cases:

-   GetCurrentAccountingMonth
-   ListAccountingMonths
-   StartAccountingMonth
-   GetAccountingMonthSummary

### Member Repository

Complete:

-   Watch active members
-   Search members
-   Add member
-   Update member
-   Change status
-   Member history

### Member Screens

Implement:

23. Member List
24. Add Member
25. Edit Member
26. Member Details
27. Member Financial Summary
28. Member Meal History
29. Member Deposit History
30. Member Expense Contribution History
31. Member Adjustments
32. Member Monthly History
33. Deactivate / Leaving
34. Reactivate

### Member Validation

Rules:

-   Name required
-   Join date valid
-   Leave date \>= join date
-   Opening balance valid
-   Historical transactions preserved after leaving

### Queries

Implement optimized queries for:

-   Current member meals
-   Deposits
-   Expenses paid
-   Adjustments
-   Monthly history

### Tests

-   Add/edit/deactivate/reactivate
-   Member leaves mid-month
-   Historical data remains
-   Opening balances
-   Search/filter

------------------------------------------------------------------------

# 10. Phase 5 --- Daily Meal Management

## Sprint 5

## Objective

Build the application's highest-frequency workflow.

Implement screens 35--44.

### Meal Domain

Use cases:

-   GetMealsForDate
-   RecordDailyMeals
-   UpdateDailyMeals
-   CopyPreviousDayMeals
-   GetMealCalendar
-   GetMemberMealHistory
-   CalculateDailyMealTotal

### Meal Modes

Support:

#### Separate

-   Breakfast
-   Lunch
-   Dinner
-   Extra

#### Total Units

Single total quantity.

### Quantity Rules

Support configured values:

``` text
0
0.5
1
1.5
2+
```

Internally use scaled integers.

### Screens

35. Meals Home
36. Daily Meal Entry
37. Separate Meal Types
38. Total Units
39. Copy Previous Day
40. Daily Summary
41. Meal Calendar
42. Meal Day Details
43. Edit Historical Meals
44. Member Meal Details

### Transactional Save

Saving an entire daily sheet must use one database transaction.

If any write fails:

-   Roll back entire sheet.
-   Preserve UI input.
-   Show retry.

### Performance

Optimize for:

-   10--15 members under one minute
-   Up to 100 members
-   Minimal rebuilds
-   Efficient list rendering

### Tests

-   Zero meals
-   Half meals
-   Custom meals
-   Copy yesterday
-   Member joins mid-month
-   Member inactive
-   Transaction rollback
-   Historical editing
-   Closed-month rejection

------------------------------------------------------------------------

# 11. Phase 6 --- Guest and Special Meals

## Sprint 6

## Guest Meals

Implement screens 45--49.

Use cases:

-   AddGuestMeal
-   UpdateGuestMeal
-   DeleteGuestMeal
-   GetGuestMealSummary

Charge modes:

-   Add to host meal
-   Direct charge
-   General mess meal

Validate accounting effect for each.

## Special Meals

Implement screens 50--55.

Use cases:

-   CreateSpecialMeal
-   SelectParticipants
-   AllocateSpecialMealCost
-   UpdateSpecialMeal
-   DeleteSpecialMeal

Distribution:

-   Equal
-   Custom
-   Single member

### Allocation Engine

Create reusable:

``` text
AmountAllocator
```

Responsibilities:

-   Equal allocation
-   Deterministic remainder handling
-   Custom allocation validation
-   Sum reconciliation

### Tests

-   Odd amount division
-   One participant
-   Many participants
-   Custom total mismatch
-   Guest direct charge
-   Guest meal rate inclusion

------------------------------------------------------------------------

# 12. Phase 7 --- Expenses and বাজার

## Sprint 7

## Objective

Implement screens 56--67.

### Expense Categories

Seed system categories.

Meal:

-   Rice
-   Fish
-   Meat
-   Vegetables
-   Eggs
-   Oil
-   Spices
-   Lentils
-   Breakfast
-   Other grocery

Shared:

-   Maid
-   Cook
-   Cleaning
-   Maintenance

### Expense Use Cases

-   AddExpense
-   UpdateExpense
-   DeleteExpense
-   SearchExpenses
-   GetExpenseSummary
-   GetMealExpenses
-   GetMemberPaidExpenses

### Screens

56. Expense Home
57. Expense List
58. Add বাজার
59. Add Shared Expense
60. Edit Expense
61. Expense Details
62. Category Selector
63. Categories
64. Add/Edit Category
65. Member-Paid Expense
66. Receipt Preview
67. Monthly Summary

### Member-Paid Expense Logic

If member pays personally:

``` text
expense recorded
+
member credit generated by settlement engine
```

Do not create an unrelated duplicate deposit.

### Receipt Attachments

Implement:

-   Camera/photo selection
-   File validation
-   Resize
-   Compression
-   UUID filename
-   Relative path storage
-   Receipt preview

### Closed Month

Block edits/deletes for closed periods.

### Tests

-   Meal expense inclusion
-   Shared expense exclusion from meal rate
-   Member payer credit
-   Receipt deletion
-   Custom categories
-   Filters
-   Aggregate totals

------------------------------------------------------------------------

# 13. Phase 8 --- Utilities, Deposits and Adjustments

## Sprint 8

## Utility Bills

Implement screens 68--74.

Use cases:

-   AddUtilityBill
-   UpdateUtilityBill
-   AllocateUtilityBill
-   MarkBillPaid
-   GetUtilitySummary

Distribution:

-   All active members
-   Selected members
-   Custom

Store allocation snapshot.

## Deposits

Implement screens 75--80.

Use cases:

-   AddDeposit
-   UpdateDeposit
-   DeleteDeposit
-   GetMemberDeposits
-   GetMonthlyDepositSummary

Methods:

-   Cash
-   bKash
-   Nagad
-   Rocket
-   Bank
-   Other

No payment gateway integration.

## Adjustments

Implement screens 81--84.

Use cases:

-   AddAdjustment
-   UpdateAdjustment
-   DeleteAdjustment

Directions:

-   Debit
-   Credit

### Tests

-   Equal utility split
-   Excluded member
-   Remainder allocation
-   Deposit CRUD
-   Adjustment direction
-   Closed-month protection

------------------------------------------------------------------------

# 14. Phase 9 --- Accounting Engine and Dashboard

## Sprint 9

## Objective

Complete deterministic financial logic before settlement UI.

### Meal Rate Engine

Implement:

``` text
MealRateCalculator
```

Input:

-   Meal expenses
-   Meal units

Output:

-   Exact internal rate
-   Display rate
-   Allocation metadata

### Member Balance Engine

Implement:

``` text
MemberBalanceCalculator
```

Calculate:

``` text
Meal cost
+ guest charges
+ special meal
+ utilities
+ shared expenses
+ debit adjustments
+ previous due

minus

deposits
+ member-paid expenses
+ credit adjustments
+ previous credit
```

### Rounding Policy

Document and implement deterministic rounding.

Requirements:

-   Do not repeatedly round intermediate values.
-   Allocated totals reconcile.
-   Remainders are deterministic.

### Meal Rate Screens

Implement:

85. Current Meal Rate
86. Meal Rate Breakdown
87. Meal Expense Breakdown
88. Total Meal Breakdown
89. Calculation Explanation

### Dashboard

Implement:

18. Home Dashboard
19. Today's Summary
20. Current Month Financial Summary
21. Recent Activity
22. Attention / Pending Tasks

### SQL Aggregates

Create efficient queries for:

-   Active member count
-   Today's meals
-   Monthly meals
-   Meal expense
-   Deposits
-   Utilities
-   Current rate
-   Recent activity

### Domain Test Matrix

Mandatory tests:

-   0 meals
-   1 member
-   Half meals
-   Guest meals
-   Special meals
-   Member joins mid-month
-   Member leaves
-   Member pays বাজার
-   Over deposit
-   Under deposit
-   Previous credit
-   Previous due
-   Utility exclusion
-   Rounding remainder
-   Zero meal expense

### Release Gate

Settlement UI must not begin until calculation engine tests pass.

------------------------------------------------------------------------

# 15. Phase 10 --- Settlement and Month Closing

## Sprints 10--11

This is the highest-risk business phase.

## Sprint 10 --- Draft Settlement

### Settlement Engine

Implement pure Dart:

``` text
SettlementCalculator
```

Input:

-   Members
-   Meals
-   Guest meals
-   Special meals
-   Meal expenses
-   Shared expenses
-   Utilities
-   Deposits
-   Member-paid expenses
-   Adjustments
-   Previous balances

Output:

-   Total meals
-   Final meal rate
-   Per-member results
-   Reconciliation results

### Pre-Settlement Validation

Create:

``` text
SettlementValidator
```

Classify:

#### Blocking

-   Allocation mismatch
-   Invalid financial record
-   Broken member reference
-   Calculation mismatch

#### Warning

-   Zero deposit
-   Zero meals
-   Unusually high amount
-   Missing optional data

### Screens

90. Settlement Home
91. Checklist
92. Generate Draft
93. Settlement Summary
94. Member Settlement List
95. Member Settlement Details
96. Reconciliation
97. Issues

### Reconciliation

Validate:

``` text
Meal expense = allocated meal cost
Utility total = utility allocations
Special meal cost = participant allocations
Shared expense = member allocations
```

## Sprint 11 --- Closing and Reopening

### Settlement Snapshot

Persist:

-   Settlement
-   MemberSettlement rows
-   Final rate
-   Allocation values
-   Close timestamp

### Close Transaction

Inside one SQLite transaction:

1.  Revalidate.
2.  Generate final settlement.
3.  Save settlement snapshot.
4.  Save member snapshots.
5.  Freeze final rate.
6.  Mark month closed.

### Screens

98. Close Month Confirmation
99. Month Closed Success
100. Reopen Month Confirmation
101. Carry Forward Balances

### Carry Forward

Create next-period opening balance records based on selected member
balances.

### Reopen

Rules:

-   Authentication if enabled
-   Change month to active/draft state
-   Preserve historical audit
-   Mark previous settlement invalid/replaced according to model
-   Require recalculation before closing again

### Tests

Mandatory:

-   Atomic close
-   Failed close rollback
-   Snapshot integrity
-   Carry forward
-   Reopen
-   Reclose
-   Historical report stability
-   Rounding reconciliation
-   Member leaves before next month

------------------------------------------------------------------------

# 16. Phase 11 --- Reports and Sharing

## Sprint 12

Implement screens 102--113.

### Report Query Layer

Create optimized report services:

-   MonthlySummaryReport
-   MemberReport
-   MealReport
-   ExpenseReport
-   DepositReport
-   UtilityReport
-   GuestMealReport
-   SpecialMealReport

### Report Filters

Support:

-   Accounting month
-   Date range
-   Member
-   Category
-   Type

### PDF

Implement:

-   Mess header
-   Accounting month
-   Summary
-   Tables
-   Member balances
-   Generated timestamp

### CSV

Implement machine-readable exports.

### Text Summary

Generate Messenger/WhatsApp-friendly compact summaries.

### Share

Use OS share sheet.

### Screens

102. Reports Home
103. Monthly Summary
104. Member
105. Meal
106. Expense
107. Deposit
108. Utility
109. Guest Meal
110. Special Meal
111. Filters
112. Preview
113. Export/Share

### Tests

-   Correct report totals
-   Bangla text rendering
-   English rendering
-   Closed-month snapshot report
-   CSV column integrity
-   Large report generation

------------------------------------------------------------------------

# 17. Phase 12 --- Backup and Restore

## Sprint 13

This phase is release-critical.

### Backup Format

Create archive:

``` text
manifest.json
database.sqlite
attachments/
```

Suggested extension:

``` text
.mmbd
```

### Manifest

Include:

-   Format version
-   App version
-   Database version
-   Created timestamp
-   Mess metadata summary

### Backup Service

Implement:

``` text
BackupService
```

Steps:

1.  Flush database.
2.  Create safe database copy.
3.  Collect attachments.
4.  Generate manifest.
5.  Create archive.
6.  Verify archive.
7.  Return file.

### Restore Service

Implement:

1.  Select file.
2.  Validate archive.
3.  Parse manifest.
4.  Check compatibility.
5.  Create safety backup.
6.  Restore to temporary directory.
7.  Run SQLite integrity check.
8.  Validate attachments.
9.  Replace live data.
10. Reload app state.

### Screens

114. Backup Home
115. Create Backup
116. Progress
117. Success
118. History
119. Restore Selection
120. Preview
121. Confirmation
122. Progress
123. Success
124. Invalid Backup
125. Reminder Settings

### Security

Protect against:

-   Path traversal
-   Malformed ZIP/archive
-   Unsupported database version
-   Corrupt database
-   Missing manifest

### Tests

-   Backup/restore round trip
-   Attachment round trip
-   Invalid archive
-   Old version
-   Future unsupported version
-   Interrupted restore
-   Safety backup
-   Financial totals after restore

### Release Gate

A production release must not ship until backup/restore round-trip tests
pass.

------------------------------------------------------------------------

# 18. Phase 13 --- Reminders, Settings and Audit

## Sprint 14

## Reminders

Implement screens 126--130.

Using:

``` text
flutter_local_notifications
```

Features:

-   Daily meal reminder
-   Bill reminder
-   Month-end reminder
-   Backup reminder

Handle:

-   Notification permission
-   Time changes
-   Rescheduling
-   Disable/cancel
-   Skip meal reminder if complete

## Settings

Implement screens 131--145.

Settings groups:

-   Mess
-   Manager
-   Language
-   Appearance
-   Meal
-   Guest meal
-   Financial
-   Security
-   PIN
-   Biometrics
-   Auto-lock
-   Data/storage
-   About

### Settings Persistence

Use:

-   Drift/AppSettings for application settings
-   Secure storage for secrets/security metadata

### Audit

Implement:

146. Activity History
147. Activity Details

Audit actions:

-   Create
-   Update
-   Delete
-   Close month
-   Reopen month
-   Restore backup

Do not expose raw JSON to standard UI.

### Tests

-   Reminder scheduling
-   Notification cancellation
-   Language persistence
-   Theme persistence
-   Security changes
-   Audit creation

------------------------------------------------------------------------

# 19. Phase 14 --- Common States and UX Hardening

## Sprint 15

Implement screens/states 148--170 consistently.

### States

148. Initial Loading
149. Skeleton Loading
150. Empty State
151. No Search Results
152. Save in Progress
153. Save Success
154. Save Failure
155. Delete Confirmation
156. Delete Failure
157. Unsaved Changes
158. Closed Month Restriction
159. Validation Summary
160. Database Upgrade
161. Storage Almost Full
162. Permission Denied

### Components

163. Date Picker
164. Month Picker
165. Member Selector
166. Multi-Member Selector
167. Amount Input
168. Confirmation Sheet
169. Search & Filter
170. Sort Sheet

### UX Consistency Review

Review every feature for:

-   App bars
-   Spacing
-   Typography
-   Button hierarchy
-   Form behavior
-   Validation
-   Error copy
-   Empty states
-   Loading
-   Success feedback
-   Closed-month behavior

### Accessibility

Audit:

-   Semantics
-   Touch targets
-   Contrast
-   Dynamic text
-   Screen-reader labels
-   Logical focus
-   Color-independent status
-   Bangla readability

### Keyboard

Verify:

-   Numeric keyboards
-   Next/done behavior
-   Keyboard dismissal
-   Form scrolling
-   Amount input
-   Search

------------------------------------------------------------------------

# 20. Phase 15 --- Performance, Reliability and Production Hardening

## Sprint 16

## Performance

Profile:

-   Dashboard
-   Daily meal list
-   Member histories
-   Expense list
-   Settlement
-   Reports

Optimize:

-   SQL indexes
-   Aggregate queries
-   Riverpod rebuild scope
-   Large lists
-   Image loading
-   Receipt compression

### Expected Data Volume

Validate:

``` text
100 members
5+ years history
thousands of meal rows
thousands of expenses
hundreds of attachments
```

### Database

Run:

-   Migration tests
-   Foreign-key checks
-   Integrity checks
-   Transaction rollback tests

### Storage

Test:

-   Low disk
-   Attachment deletion
-   Orphan cleanup
-   Temporary report cleanup
-   Backup cleanup

### Crash Resilience

Test interruptions during:

-   Meal save
-   Settlement close
-   Backup
-   Restore
-   Database migration

### Security

Review:

-   Secure storage
-   PIN
-   Biometrics
-   Sensitive logs
-   Temporary files
-   Backup validation
-   Path traversal

------------------------------------------------------------------------

# 21. Phase 16 --- Release Preparation

## Objective

Prepare production Android and iOS releases.

### Application Assets

Prepare:

-   Android adaptive icon
-   Android launcher icons
-   iOS app icon set
-   Splash assets
-   Store screenshots
-   Feature graphic where required

### Android

Configure:

-   Release signing
-   Keystore
-   ProGuard/R8 where appropriate
-   App bundle
-   Target SDK
-   Permissions review

Generate:

``` text
.aab
```

### iOS

Configure:

-   Bundle ID
-   Signing
-   Capabilities
-   Privacy descriptions
-   App icons
-   Archive

### Privacy

Document clearly:

-   Local data storage
-   Optional photo/file permissions
-   Biometrics
-   Notifications
-   No mandatory account
-   No mandatory backend

### Release QA

Test on:

-   Small Android
-   Mid-range Android
-   Recent Android
-   iPhone simulator
-   Physical iPhone where available

### Store Checklist

-   App title
-   Description
-   Screenshots
-   Privacy policy
-   Support contact
-   Category
-   Age rating
-   Release notes

------------------------------------------------------------------------

# 22. CI/CD Plan

Configure CI pipeline.

## Pull Request Pipeline

``` text
dart format --set-exit-if-changed
flutter analyze
flutter test
```

Also run:

-   Domain tests
-   Drift tests
-   Migration tests

## Main Branch

Additionally:

-   Android debug/release build
-   iOS build where CI environment supports it

## Release

Create tagged release:

``` text
v1.0.0
```

Build signed artifacts through controlled release workflow.

Never commit signing secrets.

------------------------------------------------------------------------

# 23. Testing Breakdown

## Domain Tests

Highest priority.

Target modules:

-   Money
-   MealUnits
-   AmountAllocator
-   MealRateCalculator
-   MemberBalanceCalculator
-   SettlementCalculator
-   SettlementValidator
-   CarryForwardCalculator

## Database Tests

Test:

-   CRUD
-   Relations
-   Constraints
-   Transactions
-   Aggregates
-   Migrations
-   Closed-month restrictions

## Repository Tests

Test repository behavior independent of UI.

## Controller Tests

Test Riverpod notifiers/controllers.

## Widget Tests

Priority:

-   Meal entry
-   Add expense
-   Add deposit
-   Member balance
-   Settlement
-   Backup/restore
-   PIN

## Integration Tests

### Journey 1 --- First Run

``` text
Install
→ Select Bangla
→ Create mess
→ Create month
→ Add members
→ Dashboard
```

### Journey 2 --- Daily Operation

``` text
Enter meals
→ Add বাজার
→ Add deposit
→ View rate
→ View member balance
```

### Journey 3 --- Settlement

``` text
Complete month
→ Draft settlement
→ Reconciliation
→ Close month
→ Carry forward
→ New month
```

### Journey 4 --- Backup

``` text
Create backup
→ Reset test app
→ Restore
→ Verify totals
```

------------------------------------------------------------------------

# 24. Accounting Test Dataset

Create a deterministic reference dataset.

Example:

``` text
12 members
842 total meals
৳58,720 meal expense
multiple deposits
member-paid বাজার
utilities
guest meals
special meals
adjustments
```

Expected:

``` text
meal rate ≈ ৳69.74
```

Store expected settlement results as fixtures.

Use this dataset for regression tests after changes to:

-   Calculation engine
-   Database schema
-   Settlement
-   Reports

------------------------------------------------------------------------

# 25. Database Migration Plan

Every schema modification must include:

1.  Schema version increment
2.  Migration implementation
3.  Migration test
4.  Old database fixture
5.  Post-migration integrity verification

Example:

``` text
v1 Initial
v2 Meal-off support
v3 Cloud backup metadata
```

Never use destructive migration for production user financial data.

------------------------------------------------------------------------

# 26. Suggested Jira / GitHub Epic Structure

Create epics:

1.  APP --- Foundation
2.  DB --- Local Database
3.  SEC --- Security
4.  SETUP --- Onboarding
5.  MEM --- Members
6.  MEAL --- Meals
7.  GUEST --- Guest Meals
8.  SPECIAL --- Special Meals
9.  EXP --- Expenses
10. UTIL --- Utilities
11. DEP --- Deposits
12. ADJ --- Adjustments
13. CALC --- Calculation Engine
14. DASH --- Dashboard
15. SETTLE --- Settlement
16. REPORT --- Reports
17. BACKUP --- Backup & Restore
18. REM --- Reminders
19. SETTINGS --- Settings
20. AUDIT --- Audit
21. UX --- Common UI
22. QA --- Testing
23. REL --- Release

Example ticket:

``` text
MEAL-014
Implement transactional daily meal save

Acceptance Criteria:
- Saves all member meal rows atomically
- Supports half meals
- Rolls back on failure
- Rejects closed-month modification
- Updates dashboard stream
- Unit/integration tests included
```

------------------------------------------------------------------------

# 27. Dependency Order

Critical path:

``` text
Flutter Foundation
        ↓
Database
        ↓
Mess + Accounting Month
        ↓
Members
        ↓
Meals + Expenses + Deposits + Utilities
        ↓
Calculation Engine
        ↓
Settlement
        ↓
Reports
        ↓
Backup/Restore
        ↓
Production Release
```

Do not implement settlement before core transaction modules and
calculation rules are stable.

------------------------------------------------------------------------

# 28. MVP Release Scope

## Mandatory

-   Setup
-   Bangla/English
-   PIN
-   Members
-   Accounting months
-   Daily meals
-   বাজার
-   Shared expenses
-   Utilities
-   Deposits
-   Adjustments
-   Guest meals
-   Meal rate
-   Member balances
-   Dashboard
-   Settlement
-   Month closing
-   Carry forward
-   Basic reports
-   Local backup/restore
-   Settings
-   Common UI states

## Strongly Recommended

-   Biometrics
-   Special meals
-   Receipts
-   Local reminders
-   Audit history

## Post-MVP

-   Google Drive backup
-   OneDrive backup
-   Dropbox backup
-   Multiple messes
-   Scheduled meal-off
-   OCR
-   Advanced analytics
-   Home widgets

------------------------------------------------------------------------

# 29. Production Release Gates

The app should not be considered production-ready until all gates pass.

## Gate 1 --- Accounting

-   Meal rate tests pass.
-   Member balance tests pass.
-   Allocation tests pass.
-   Settlement reconciliation passes.

## Gate 2 --- Persistence

-   Database integrity passes.
-   Migration tests pass.
-   Transaction rollback tests pass.

## Gate 3 --- Recovery

-   Backup creation passes.
-   Restore passes.
-   Restored totals equal original totals.
-   Invalid backups are rejected safely.

## Gate 4 --- Security

-   PIN works.
-   Biometrics fallback works.
-   No plaintext secret storage.
-   Sensitive logs reviewed.

## Gate 5 --- Localization

-   Complete English UI.
-   Complete Bangla UI.
-   No clipped major screens.
-   Bangla PDFs/reports verified.

## Gate 6 --- Device QA

-   Android QA passes.
-   iOS QA passes.
-   Small-screen QA passes.
-   Dark/light mode passes.

## Gate 7 --- Month-End Journey

A complete realistic month must be executable:

``` text
Create mess
→ Add members
→ Record meals
→ Record expenses
→ Record utilities
→ Record deposits
→ Calculate rate
→ Review balances
→ Generate settlement
→ Reconcile
→ Close month
→ Carry balances
→ Start next month
→ Generate report
→ Backup
```

------------------------------------------------------------------------

# 30. Recommended Sprint Summary

  Sprint   Major Deliverable
  -------- -------------------------------------
  1        Flutter foundation
  2        Drift/database/domain foundation
  3        Setup, localization, PIN/biometrics
  4        Members + accounting months
  5        Daily meals
  6        Guest + special meals
  7        Expenses + receipts
  8        Utilities + deposits + adjustments
  9        Calculation engine + dashboard
  10       Draft settlement
  11       Month close/reopen/carry forward
  12       Reports/export/share
  13       Backup/restore
  14       Reminders/settings/audit
  15       Common UX/accessibility
  16       Hardening/performance/release QA

------------------------------------------------------------------------

# 31. Final Engineering Priorities

When trade-offs are necessary, prioritize in this order:

1.  Accounting correctness
2.  Data integrity
3.  Backup/recovery
4.  Daily meal-entry speed
5.  Settlement transparency
6.  Offline reliability
7.  Bangla usability
8.  Security
9.  Performance
10. Visual polish

A visually polished application with unreliable settlement logic is
unacceptable for this product.

The implementation should therefore treat the pure-Dart accounting
engine, SQLite transactions, reconciliation, migrations, and
backup/restore as first-class production features rather than supporting
utilities.
