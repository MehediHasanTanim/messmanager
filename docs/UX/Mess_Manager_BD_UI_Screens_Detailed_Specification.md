# Mess Manager BD --- UI Screens & Detailed Specification

## 1. Purpose

This document defines the mobile UI inventory and UX specification for
the Flutter-based, fully offline **Mess Manager BD** application.

Primary goals: - Fast daily meal entry - Simple বাজার, deposit, utility,
and member management - Transparent meal-rate calculations - Clear
member balances - Safe month-end settlement - Bangla and English
support - One-handed mobile usage - Offline-first behavior - Strong
protection around financial changes

## 2. Primary Navigation

Recommended bottom navigation:

1.  Home
2.  Meals
3.  Expenses
4.  Members
5.  More

The active accounting month should remain visible on accounting-related
screens:

`October 2026 ▼`

More contains Deposits, Utility Bills, Settlement, Reports, Backup &
Restore, Reminders, and Settings.

## 3. Global UX Rules

-   Never communicate balances using color alone.
-   Use explicit labels: `Mess owes Rahim ৳680`, `Karim owes mess ৳850`,
    `Settled`.
-   Offline operation is normal; do not show a permanent offline
    warning.
-   Use numeric keyboards for amounts and meal quantities.
-   Preserve form input after recoverable errors.
-   Warn before discarding unsaved financial changes.
-   Closed months are read-only until deliberately reopened.
-   All visible strings must support English and বাংলা.
-   Routine saves should use lightweight confirmation rather than modal
    dialogs.
-   Every calculated amount should have a path to its source
    transactions.

# 4. Complete Screen Inventory

## A. Launch, Setup & Security

1.  Splash / App Initialization
2.  Language Selection
3.  Welcome
4.  Create Mess
5.  Manager Setup
6.  Initial Accounting Month Setup
7.  Setup Complete
8.  Create App PIN
9.  Confirm App PIN
10. Biometric Setup
11. App Lock
12. PIN Recovery Guidance

## B. Shell & Month Context

13. Main App Shell
14. Accounting Month Selector
15. Accounting Month Details
16. Start New Month
17. Closed Month View

## C. Dashboard

18. Home Dashboard
19. Today's Summary
20. Current Month Financial Summary
21. Recent Activity
22. Attention / Pending Tasks

## D. Members

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
33. Deactivate / Member Leaving
34. Reactivate Member

## E. Meals

35. Meals Home
36. Daily Meal Entry
37. Separate Meal Types Entry
38. Total Units Entry
39. Copy Previous Day
40. Daily Meal Summary
41. Meal Calendar
42. Meal Day Details
43. Edit Historical Meals
44. Member Meal Details

## F. Guest Meals

45. Guest Meal List
46. Add Guest Meal
47. Edit Guest Meal
48. Guest Meal Details
49. Guest Meal Monthly Summary

## G. Special Meals

50. Special Meal List
51. Add Special Meal
52. Select Participants
53. Cost Distribution
54. Special Meal Details
55. Edit Special Meal

## H. Expenses / বাজার

56. Expense Home
57. Expense List
58. Add বাজার Expense
59. Add Shared / Other Expense
60. Edit Expense
61. Expense Details
62. Expense Category Selector
63. Expense Categories
64. Add / Edit Expense Category
65. Member-Paid Expense Entry
66. Receipt Preview
67. Expense Monthly Summary

## I. Utility Bills

68. Utility Bill List
69. Add Utility Bill
70. Edit Utility Bill
71. Utility Bill Details
72. Utility Cost Distribution
73. Select Members for Utility
74. Utility Monthly Summary

## J. Deposits

75. Deposit List
76. Add Deposit
77. Edit Deposit
78. Deposit Details
79. Member Deposit Summary
80. Monthly Deposit Summary

## K. Adjustments

81. Adjustment List
82. Add Member Adjustment
83. Edit Adjustment
84. Adjustment Details

## L. Meal Rate

85. Current Meal Rate
86. Meal Rate Breakdown
87. Meal Expense Breakdown
88. Total Meal Breakdown
89. Calculation Explanation

## M. Settlement

90. Settlement Home
91. Pre-Settlement Checklist
92. Generate Draft Settlement
93. Settlement Summary
94. Member Settlement List
95. Member Settlement Details
96. Settlement Reconciliation
97. Settlement Issues
98. Close Month Confirmation
99. Month Closed Success
100. Reopen Month Confirmation
101. Carry Forward Balances

## N. Reports

102. Reports Home
103. Monthly Summary Report
104. Member Report
105. Meal Report
106. Expense Report
107. Deposit Report
108. Utility Report
109. Guest Meal Report
110. Special Meal Report
111. Report Filters
112. Report Preview
113. Export / Share Report

## O. Backup & Restore

114. Backup & Restore Home
115. Create Backup
116. Backup Progress
117. Backup Success
118. Backup History
119. Restore File Selection
120. Restore Backup Preview
121. Restore Confirmation
122. Restore Progress
123. Restore Success
124. Invalid / Incompatible Backup
125. Backup Reminder Settings

## P. Reminders

126. Reminder Settings
127. Daily Meal Reminder
128. Bill Reminder
129. Month-End Reminder
130. Backup Reminder

## Q. Settings

131. Settings Home
132. Mess Profile
133. Edit Mess Profile
134. Manager Profile
135. Language Settings
136. Appearance Settings
137. Meal Settings
138. Guest Meal Settings
139. Financial Settings
140. Security Settings
141. Change PIN
142. Biometric Settings
143. Auto-Lock Settings
144. Data & Storage
145. About App

## R. Audit

146. Activity History
147. Activity Details

## S. Common UI States & Components

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
159. Validation Error Summary
160. Database Upgrade
161. Storage Almost Full
162. Permission Denied
163. Date Picker
164. Month Picker
165. Member Selector
166. Multi-Member Selector
167. Amount Input
168. Confirmation Bottom Sheet
169. Search & Filter Sheet
170. Sort Sheet

# 5. Launch & Setup Specifications

## 5.1 Splash / App Initialization

Show logo, `Mess Manager BD`, and optional tagline
`মেসের হিসাব, সহজভাবে`.

Background work: - Open SQLite database - Run migrations - Load
settings - Determine language - Check setup status - Check app lock

If startup fails, replace indefinite loading with `Try Again` and
`Restore Backup`.

## 5.2 Language Selection

Title: `Choose Language / ভাষা নির্বাচন করুন`

Large cards: - বাংলা - English

Primary: `Continue`

Persist immediately.

## 5.3 Welcome

Explain:
`Manage meals, বাজার, deposits, bills and monthly হিসাব from one place—even without internet.`

Show benefits: - Daily meal tracking - Automatic meal rate - Member
balances - Monthly settlement - Offline operation

Primary: `Set Up My Mess` Secondary: `Restore Existing Backup`

## 5.4 Create Mess

Fields: - Mess name \* - Area/address - Currency: BDT - Preferred
language

Primary: `Continue`

## 5.5 Manager Setup

Fields: - Manager name \* - Phone - Optional photo

Explain that information remains local and may appear on reports.

## 5.6 Initial Accounting Month

Fields: - Month/year - Start date - Opening balances toggle

Explain that meals, expenses and deposits belong to an accounting month.

## 5.7 PIN & Biometrics

PIN screens use numeric keypad and concealed indicators.

Biometric setup: - `Enable` - `Not Now`

Lock screen shows logo, mess name, PIN keypad, and biometric action
without exposing financial content.

# 6. Application Shell

Top app bar example:

`Green View Bachelor Mess` `October 2026 ▼`

Bottom navigation: `Home | Meals | Expenses | Members | More`

Use context-specific actions rather than a universal floating button.

# 7. Accounting Month UX

## 7.1 Month Selector

Current: `October 2026 — ACTIVE`

History: `September 2026 — CLOSED` `August 2026 — CLOSED`

Closed periods use lock indicators.

## 7.2 Start New Month

Fields: - Month - Start date - Carry balances forward - Active members
to include

Warn if the current month is not closed.

## 7.3 Closed Month View

Show final meal rate, meals, expenses, settlement date and read-only
financial records.

Actions: - View Final Settlement - Share Report - Reopen Month

# 8. Home Dashboard

Header: `October 2026 ▼` `Thursday, 1 October`

## Meal Rate Hero

`Current Meal Rate` `৳69.74` `842 meals • ৳58,720 meal expense`

Tap opens breakdown.

## Today's Meals

`31 meals` `10 of 12 members entered` `2 pending`

Primary: `Enter Meals`

## Monthly Overview

Cards: - Total Meals - Meal Expense - Deposits - Other Expenses

## Mess Fund

Show recorded fund position with an info action explaining calculation.

## Balance Attention

Example: `3 members have outstanding dues`

## Quick Actions

-   Meals
-   বাজার
-   Deposit
-   Bill
-   Guest Meal
-   Settlement

## Recent Activity

Show latest five entries with timestamp and `View All`.

# 9. Member Screens

## 9.1 Member List

Search and filters: - Active - Inactive - Left - All

Row example:

`Rahim — Room 3` `82 meals • Mess owes ৳680`

Primary: `+ Add Member`

## 9.2 Add / Edit Member

Sections:

Basic: - Name \* - Nickname - Phone - Room - Photo

Membership: - Join date - Status

Opening account: - Opening balance - Member owes mess / Mess owes member
/ None

Notes.

Sticky `Add Member` or `Save Changes`.

## 9.3 Member Details

Header with avatar, name, room, status.

Balance hero: `Mess owes Rahim` `৳680`

Stats: - Meals - Meal cost - Deposits - Other charges - বাজার paid

Tabs: - Overview - Meals - Deposits - Activity

Actions: - Add Deposit - Add Adjustment - View Settlement

## 9.4 Member Financial Summary

Payable: - Meal cost - Utility share - Guest/special meals - Other
charges - Debits

Credits: - Deposits - বাজার paid - Credits

Final balance uses explicit direction text. Every line with source
records should be tappable.

# 10. Daily Meals

## 10.1 Meals Home

Prominent date selector: `‹ Thu, 1 Oct ›`

Summary: - Total meal units - Members entered - Guest meals - Missing
entries

Primary: `Enter / Edit Meals`

Secondary: - Guest Meal - Calendar - History

## 10.2 Separate Meal Types Entry

Sticky header: `Thu, 1 October • Total 31`

Toolbar: - Copy Yesterday - Set Defaults - Clear - Search

Member row:

`Rahim` `Breakfast [1]  Lunch [1]  Dinner [1]` `Total 3`

Support quick 0/1 toggling and custom 0.5, 1.5, 2 or other allowed
units.

Sticky footer: `12 members • 31 meals` `Save Meals`

## 10.3 Total Units Mode

Rows: `Rahim   − 3 +` `Karim   − 2 +` `Hasan   − 0 +`

Bulk shortcuts may include: - Copy Yesterday - All 3 - All 2 - Clear

## 10.4 Copy Previous Day

Preview source date, member count and total meals.

Warn that existing destination values will be replaced.

## 10.5 Meal Calendar

Each date shows compact total and state: - Complete - No entry -
Partial - Future

Selecting a date reveals summary and edit action.

# 11. Guest Meals

## Guest Meal List

Filter by date and host.

Row: `1 Oct • Rahim • 2 guest meals` `Added to host meal count`

## Add Guest Meal

Fields: - Date - Host member - Guest name - Guest count - Meal
quantity/type

Charge method: 1. Add to host meal count 2. Charge host separately 3.
General mess meal

Direct charge reveals amount input.

# 12. Special Meals

List card: `Friday Special Dinner` `2 Oct • ৳3,600 • 10 participants`

Add flow: - Title - Date - Cost - Notes - Select participants -
Distribution

Distribution: - Equal - Custom - One member

Always show allocation preview before save.

# 13. Expenses / বাজার

## 13.1 Expense Home

Summary: - Meal / বাজার - Utilities - Other

Quick actions: - Add বাজার - Add Other Expense

Tabs: - All - বাজার - Shared - Utilities

## 13.2 Expense List

Search/filter by date, category and type.

Row: `Vegetables` `৳1,850` `1 Oct • Paid by Karim • Meal expense`

## 13.3 Add বাজার

Large amount input: `৳ [1850]`

Fields: - Date * - Category * - Description - Paid by - Payment source -
Vendor - Receipt - Notes

Display: `Included in meal-rate calculation ✓`

The category should normally determine this automatically.

## 13.4 Add Shared Expense

Fields: - Amount - Date - Category - Description - Paid by -
Distribution method - Members - Receipt - Notes

Live preview: `৳1,200 ÷ 12 members = ৳100 each`

## 13.5 Expense Details

Show amount, category, date, payer, meal-rate treatment, vendor, notes
and receipt.

If personally paid:
`Karim paid this expense. ৳1,850 is credited to Karim.`

# 14. Utility Bills

## Utility List

Summary: `October Utilities ৳6,800` `Paid ৳5,200 • Pending ৳1,600`

Rows show type, amount, due date and status.

## Add Utility

Fields: - Bill type - Billing month - Amount - Due date - Paid
status/date - Paid by - Receipt - Notes

Distribution preview: `Equal among 12 active members`

## Distribution

Modes: - Equal all active members - Selected members - Custom

Custom allocation shows: `Allocated` `Remaining`

Saving is blocked until allocation reconciles.

# 15. Deposits

## Deposit List

Monthly total plus searchable member rows.

Example: `Rahim • ৳2,500 • 1 Oct • bKash`

## Add Deposit

Large amount input.

Fields: - Member * - Date * - Payment method - Reference - Notes

Methods: - Cash - bKash - Nagad - Rocket - Bank - Other

After save: `Deposit saved` `Rahim's total this month: ৳7,000`

Secondary: `Add Another`

# 16. Adjustments

Add form: - Member - Date - Type - Direction - Amount - Reason - Notes

Direction: - Member owes more --- Debit - Member receives credit ---
Credit

Live explanation: `This increases Karim's payable amount by ৳300.`

# 17. Meal Rate Screens

## Current Meal Rate

Hero: `৳69.74 per meal`

Details: `Total meal expense ৳58,720` `Total meals 842`

Formula: `৳58,720 ÷ 842 = ৳69.74`

Actions: - Meal Expenses - Meal Breakdown - How Calculation Works

## Meal Expense Breakdown

Category totals with drill-down to transactions.

## Total Meal Breakdown

Show regular member meals, guest meals and other included units.

## Calculation Explanation

Plain-language explanation of: - Eligible meal expenses - Excluded
expenses - Guest meals - Rounding - Finalization after month closing

# 18. Settlement

## 18.1 Settlement Home

Active: `October 2026 • Not finalized`

Show current totals and `Review Settlement`.

Closed: `CLOSED • Final Meal Rate ৳69.74`

## 18.2 Pre-Settlement Checklist

Separate:

### Must Fix

Blocking reconciliation/data errors.

### Review Recommended

Valid but unusual situations.

Examples: - Meals entered through month end - বাজার reviewed - Utilities
entered - Members with zero deposits - Allocations reconciled

Primary: `Generate Draft Settlement`

## 18.3 Draft Generation

Progress stages: - Counting meals - Calculating final meal rate -
Allocating expenses - Applying deposits - Applying adjustments -
Reconciling totals

## 18.4 Settlement Summary

Hero: `842 meals` `৳58,720 meal expense` `৳69.74 final meal rate`

Show: - Meal expenses - Utilities/shared expenses - Deposits -
Member-paid expenses

Balance groups: - Members owing mess - Mess owing members - Settled

## 18.5 Member Settlement List

Filters: - All - Owes Mess - Mess Owes - Settled

Row: `Rahim • 82 meals` `Mess owes Rahim ৳711.32`

## 18.6 Member Settlement Details

Show complete Payable and Credit sections.

Payable: - Meal cost - Guest meals - Special meals - Utilities - Shared
expenses - Debits - Previous due

Credits: - Deposits - বাজার paid - Credits - Previous credit

Calculation: `Total Credit - Total Payable = Final Balance`

Actions: - Share Summary - View Source Transactions

## 18.7 Reconciliation

For each allocation:

`Expected ৳58,720` `Allocated ৳58,720` `Difference ৳0` `Balanced ✓`

Settlement cannot close with blocking differences.

## 18.8 Close Month

Explain: - Final rate freezes - Settlement snapshot saves - Normal
editing disables - Balances may carry forward - Reopening requires
deliberate confirmation

Require `I reviewed the settlement`.

## 18.9 Month Closed

Show final rate, total meals and close date.

Actions: - View Settlement - Share Report - Start Next Month

## 18.10 Reopen Month

Strong warning that reopening invalidates the current final settlement
until recalculated.

Require PIN/biometric when enabled.

## 18.11 Carry Forward

List all non-zero balances with checkboxes and explicit direction.

# 19. Reports

Reports Home: - Monthly Summary - Member - Meals - Expenses - Deposits -
Utilities - Guest Meals - Special Meals

Filters can include: - Accounting month - Date range - Member -
Category - Type

Exports: - PDF - CSV - Text summary - Image summary where appropriate

Use native share sheet.

# 20. Backup & Restore

## Backup Home

Show last backup date and reminder.

Explain that data is stored on this phone.

Primary: `Create Backup`

Secondary: `Restore Backup`

## Create Backup

Show included content: - Database - Member/month counts - Receipt count

Options: - Include receipts - Include photos

## Backup Progress

Stages: - Preparing database - Collecting attachments - Creating
archive - Verifying

## Backup Success

Show filename, date, size and version.

Actions: - Share - Save to Files - Done

## Restore

Flow: 1. Choose file 2. Preview backup 3. Validate compatibility 4. Warn
that current data will be replaced 5. Create safety backup 6.
Authenticate if enabled 7. Restore 8. Show success

Never overwrite current data immediately after file selection.

# 21. Reminders

Settings: - Daily meal entry - Utility due - Month-end - Backup

Example: `Daily Meal Entry • Every day 10:00 PM • ON`

Meal reminder can skip automatically when today's entry is complete.

# 22. Settings

Sections:

### Mess

-   Mess Profile
-   Meal Settings
-   Guest Meal Settings
-   Financial Settings

### App

-   Language
-   Appearance
-   Notifications

### Security

-   PIN
-   Biometrics
-   Auto-lock

### Data

-   Backup & Restore
-   Storage

### About

-   App information

## Meal Settings

-   Separate meal types vs total units
-   Whole/half/custom units
-   Daily defaults

## Guest Settings

-   Default charging method
-   Guest-name behavior
-   Meal-rate inclusion

## Financial Settings

-   BDT
-   Decimal display
-   Default shared distribution
-   Carry-forward default
-   Financial deletion confirmation

Changes must never silently rewrite closed settlements.

## Data & Storage

Show database, receipt and backup sizes.

Actions: - Manage backups - Clean temporary files - Export - Restore

Danger zone: `Reset All App Data`

Require strong confirmation and authentication.

# 23. Audit / Activity

Activity History filters: - All - Meals - Expenses - Deposits -
Settlement - Backup

Activity Details show action, time, entity, and human-readable
before/after values.

Do not expose raw JSON in the normal UI.

# 24. Reusable Components

## Member Selector

Searchable avatar/name/room list.

## Multi-Member Selector

-   Select All
-   Clear
-   Search
-   Checkboxes
-   Selected count
-   Done

## Amount Input

Requirements: - BDT prefix - Numeric keyboard - Thousands formatting -
Decimal support - Paste - No negative values unless explicitly valid -
Accessible semantics

## Date Picker

Respect accounting-period boundaries when required.

## Search & Filter

Always provide: - Active filter count - Clear all - Apply

# 25. Common UI States

## Empty

Contextual copy and action.

Members: `No members yet` `Add First Member`

Expenses: `No expenses recorded for October` `Add বাজার`

Guest meals: `No guest meals this month`

Do not force an action when empty is valid.

## No Search Results

Show query and `Clear Search`; show `Clear Filters` when relevant.

## Loading

Local data should normally load quickly. Prefer short layout-matching
skeletons over indefinite spinners.

## Save Success

Use snackbar: `Expense saved`

Important contextual confirmation:
`Deposit saved • Rahim's total: ৳7,000`

## Save Failure

Preserve form values:
`Couldn't save. Your entered information is still here.`

## Delete Confirmation

State consequence:

`Delete ৳2,500 deposit for Rahim?`
`Rahim's October balance will be recalculated.`

## Unsaved Changes

`Discard unsaved changes?` - Keep Editing - Discard

## Closed Month Restriction

`October 2026 is closed. Financial records cannot be edited directly.`

Reopening should happen through month/settlement management.

## Validation Summary

Example: `Please fix 2 items` - Amount is required - Select at least one
member

Also show inline field errors.

## Database Upgrade

User-facing copy: `Updating Mess Manager BD`
`We're preparing your existing data for this version.`

Offer recovery actions if upgrade fails.

## Storage Almost Full

Explain that receipts/backups may fail. Never automatically delete
financial data.

## Permission Denied

Core accounting remains usable without optional camera/photo
permissions.

# 26. Accessibility

Support: - Screen readers - Logical focus - Large touch targets -
Dynamic text where practical - Text labels with icons - Adequate
contrast - Reduced motion - Balance meaning beyond color - Readable
Bangla at larger font sizes

# 27. Responsive Requirements

Target: - Common Android phones in Bangladesh - Modern iPhones - Small
and large phones - Portrait-first - Graceful landscape behavior

Forms use single-column mobile layout. Tablet-specific layouts can come
later.

# 28. High-Frequency Flows

## Daily Meals

`Home → Enter Meals → Adjust → Save`

Target: under one minute for 10--15 members.

## Add বাজার

`Home/Expenses → Add বাজার → Amount → Category → Paid By → Save`

Target: roughly 10--20 seconds for routine entry.

## Deposit

`Home → Deposit → Member → Amount → Method → Save`

## Month End

`Settlement → Checklist → Draft → Summary → Member Review → Reconciliation → Close → Carry Forward → New Month`

# 29. Implementation Priority

## P0 --- First usable production build

-   Setup
-   App shell
-   Dashboard
-   Members
-   Daily meals
-   Expense/bাজার
-   Deposits
-   Utilities
-   Meal rate
-   Member balances
-   Settlement
-   Month close/start
-   Basic reports
-   Backup/restore
-   Settings
-   PIN lock
-   Common states

## P1

-   Guest meals
-   Special meals
-   Expense categories
-   Adjustments
-   Receipt attachments
-   Activity history
-   Reminders
-   Biometrics
-   Advanced report filters

## P2

-   Multiple messes
-   Cloud backup adapters
-   Scheduled meal-off
-   Advanced analytics
-   OCR
-   Home widgets
-   Advanced audit tools

# 30. UX Acceptance Criteria

1.  Meals for 10--15 members can be entered in under one minute.
2.  Routine বাজার entry requires minimal typing.
3.  A member balance is understandable without accounting knowledge.
4.  Meal rate is traceable to meals and eligible expenses.
5.  Settlement amounts are traceable to source records.
6.  Closed months cannot be accidentally modified.
7.  Core workflows work with no internet.
8.  Every core workflow is fully usable in বাংলা.
9.  Backup/restore is understandable to a non-technical manager.
10. Month-end settlement requires no external calculator or spreadsheet.
