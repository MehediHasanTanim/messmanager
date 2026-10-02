# Mess Manager BD --- Detailed Feature List

## 1. Product Overview

**Mess Manager BD** is a mobile application for managing shared
bachelor/student mess expenses in Bangladesh. The app is designed to
work **fully offline on a single manager's phone**, without requiring a
backend, account, internet connection, or remote database.

The manager records members, daily meals, বাজার (grocery/market)
expenses, utility and other shared costs, deposits, guest meals, and
adjustments. The application automatically calculates meal rate, each
member's payable amount, current balance, and monthly settlement.

### Core principles

-   Offline-first and usable without internet
-   One manager/device as the source of truth
-   Simple enough for everyday mess management
-   Bangla + English friendly
-   Bangladesh currency (৳ / BDT)
-   Transparent calculations that members can easily understand
-   Fast daily meal entry
-   Accurate month-end settlement
-   Local backup/export to prevent data loss

------------------------------------------------------------------------

# 2. MVP Features

## 2.1 Mess Setup

Create and configure a mess.

**Fields** - Mess name - Mess address/area (optional) - Manager name -
Mobile number (optional) - Default currency: BDT - Default language:
বাংলা / English - Current accounting month - Month start date - Optional
mess logo/photo

**Settings** - Meal calculation method - Whether breakfast/lunch/dinner
are tracked separately - Guest meal handling - Utility cost distribution
rule - Decimal precision for meal rate - Member status rules

------------------------------------------------------------------------

## 2.2 Member Management

Maintain everyone participating in the mess.

### Member information

-   Member name
-   Nickname
-   Mobile number
-   Room/seat number
-   Join date
-   Opening balance
-   Profile photo/avatar
-   Notes
-   Active/inactive status

### Member actions

-   Add member
-   Edit member
-   Temporarily deactivate member
-   Mark member as left
-   Reactivate member
-   View member details
-   View member financial summary
-   View member meal history
-   View deposits and expenses
-   View monthly settlement history

A member who leaves should remain in historical reports.

------------------------------------------------------------------------

# 3. Daily Meal Management

This is the primary daily workflow.

## 3.1 Daily Meal Entry

The manager can enter meals for all active members from one screen.

Example:

  Member     Breakfast   Lunch   Dinner   Total
  -------- ----------- ------- -------- -------
  Rahim              1       1        1       3
  Karim              0       1        1       2
  Hasan              1       0        1       2

If the mess does not need separate meal types, the manager can directly
enter total meal units.

### Supported meal quantities

-   0 meal
-   0.5 meal
-   1 meal
-   Multiple meals
-   Custom meal quantity

This supports cases such as half meals or additional portions.

## 3.2 Quick Meal Entry

-   Copy yesterday's meals
-   Set all members to default meals
-   Set all to zero
-   Increase/decrease meal using +/−
-   Search member
-   Filter active members
-   Save entire day's meal sheet at once
-   Unsaved-change warning

## 3.3 Meal History

-   Daily history
-   Member-wise history
-   Monthly calendar
-   Edit previous day's meals
-   Show who modified the entry locally, if manager profiles are added
    later
-   Daily total meal count

------------------------------------------------------------------------

# 4. Guest Meals

Record meals consumed by guests.

### Guest meal information

-   Host member
-   Date
-   Guest name (optional)
-   Breakfast/lunch/dinner or total meal quantity
-   Number of guests
-   Notes

### Charging options

Guest meals can be:

-   Added to the host member's meal count
-   Charged separately to the host
-   Included in general mess meals

Default behavior should be configurable.

### Reports

-   Guest meals by member
-   Guest meals by date
-   Monthly guest meal total
-   Guest meal cost

------------------------------------------------------------------------

# 5. Extra / Special Meals

Support meals that should not be treated as normal meals.

Examples:

-   Special Friday meal
-   Beef/chicken feast
-   Iftar
-   Sehri
-   Birthday meal
-   Picnic/special dinner

### Fields

-   Date
-   Name/reason
-   Participants
-   Total cost
-   Distribution method
-   Notes

### Distribution

Cost may be:

-   Split equally among selected members
-   Charged to one member
-   Split using custom amounts
-   Treated as regular বাজার expense

------------------------------------------------------------------------

# 6. বাজার / Grocery Expense Management

Record daily বাজার and food-related expenses.

## 6.1 Add বাজার Expense

Fields:

-   Date
-   Amount
-   Purchased by
-   Expense category
-   Shop/vendor (optional)
-   Description
-   Receipt photo (optional, stored locally)
-   Payment source
-   Notes

### Suggested categories

-   Rice
-   Fish
-   Meat
-   Vegetables
-   Eggs
-   Oil
-   Spices
-   Lentils
-   Breakfast items
-   Snacks
-   Drinking water
-   Cooking gas
-   Other grocery

Custom categories can be created.

## 6.2 Expense List

-   Today
-   This week
-   This month
-   Member-wise
-   Category-wise
-   Search
-   Filter
-   Sort
-   Edit/delete expense

## 6.3 বাজার Contributor Tracking

If a member buys বাজার using personal money:

-   Record member as payer
-   Amount becomes money receivable by that member from the mess
-   Reflect automatically in settlement

This prevents the manager from having to manually adjust balances.

------------------------------------------------------------------------

# 7. Other Shared Expenses

Not every shared expense should affect the meal rate.

Separate non-meal expenses from বাজার expenses.

Examples:

-   Maid/bua salary
-   Cook salary
-   Cleaner
-   Wi-Fi
-   Electricity
-   Gas
-   Water
-   Garbage/service charge
-   House maintenance
-   Cleaning products
-   Common household products
-   Miscellaneous

Each expense can define how it will be distributed.

------------------------------------------------------------------------

# 8. Utility Bills

Dedicated utility bill management.

### Bill types

-   Electricity
-   Gas
-   Water
-   Internet/Wi-Fi
-   Service charge
-   Other

### Fields

-   Billing month
-   Bill type
-   Amount
-   Due date
-   Paid date
-   Paid/unpaid
-   Paid by
-   Receipt/photo
-   Notes

### Distribution rules

-   Equal among active members
-   Equal among selected members
-   Custom amount per member
-   Exclude selected members

------------------------------------------------------------------------

# 9. Member Deposits

Track money submitted to the mess fund.

### Deposit fields

-   Member
-   Date
-   Amount
-   Payment method
-   Reference/note
-   Received by

### Payment methods

-   Cash
-   bKash
-   Nagad
-   Rocket
-   Bank transfer
-   Other

No payment gateway is required; these are record-keeping options only.

### Deposit features

-   Add deposit
-   Edit/delete deposit
-   Member deposit history
-   Monthly total deposit
-   Receipt/shareable confirmation
-   Current mess cash/fund calculation

------------------------------------------------------------------------

# 10. Personal Adjustments

Allow controlled adjustments without changing historical meal or expense
records.

Examples:

-   Previous month carry-forward
-   Refund
-   Fine
-   Discount
-   Damage charge
-   Advance adjustment
-   Manual correction

Fields:

-   Member
-   Date
-   Adjustment type
-   Debit/credit
-   Amount
-   Reason
-   Notes

All manual adjustments should be clearly visible in settlement details.

------------------------------------------------------------------------

# 11. Meal Rate Calculation

The application automatically calculates the meal rate.

### Basic formula

``` text
Meal Rate = Total Meal-related Expenses / Total Meals
```

Example:

``` text
Total meals       = 842
Meal expenses     = ৳58,720

Meal rate         = 58,720 / 842
                  = ৳69.74
```

### Member meal cost

``` text
Member Meal Cost = Member Total Meals × Meal Rate
```

Example:

``` text
Rahim's meals = 82
Meal rate      = ৳69.74

Meal cost      = ৳5,718.68
```

The calculation screen should show the formula and source totals for
transparency.

------------------------------------------------------------------------

# 12. Individual Member Balance

Each member receives a live financial summary.

### Summary

-   Total meals
-   Regular meal cost
-   Guest meals
-   Extra/special meal charges
-   Utility share
-   Other shared expense share
-   Personal adjustments
-   বাজার paid personally
-   Total deposits
-   Previous balance
-   Final payable/receivable amount

### Balance status

Examples:

``` text
Rahim
Deposited:       ৳7,000
Total payable:   ৳6,320
Balance:         +৳680
```

or

``` text
Karim
Deposited:       ৳5,000
Total payable:   ৳5,850
Due:             ৳850
```

Use clear labels such as:

-   **Mess owes member**
-   **Member owes mess**
-   **Settled**

rather than relying only on positive/negative signs.

------------------------------------------------------------------------

# 13. Mess Dashboard

The home screen should provide an immediate overview.

### Current month cards

-   Total members
-   Today's meals
-   Total monthly meals
-   Total বাজার expense
-   Total meal-related expense
-   Current meal rate
-   Total deposits
-   Total utility/other expense
-   Current mess fund/cash position
-   Members with outstanding dues

Example:

``` text
October 2026

Members              12
Today's Meals         31
Total Meals           842
Meal Expense          ৳58,720
Current Meal Rate     ৳69.74
Member Deposits       ৳71,500
Other Expenses        ৳8,400
```

### Quick actions

-   Add meals
-   Add বাজার
-   Add deposit
-   Add bill
-   Add guest meal
-   View settlement

------------------------------------------------------------------------

# 14. Daily Dashboard

Provide a focused daily view.

Show:

-   Date
-   Total meals today
-   Members with zero meals
-   Guest meals
-   বাজার today
-   Expenses today
-   Deposits today
-   Pending meal entry warning

This helps the manager complete daily bookkeeping quickly.

------------------------------------------------------------------------

# 15. Monthly Accounting Period

Each month should be treated as a separate accounting period.

Examples:

-   September 2026
-   October 2026
-   November 2026

### Month states

-   Active
-   Draft settlement
-   Closed

Only one month is normally active.

### Month actions

-   Start new month
-   Carry balances forward
-   Review previous month
-   Generate settlement
-   Close month
-   Reopen month with confirmation

Historical months remain read-only by default after closing.

------------------------------------------------------------------------

# 16. Monthly Settlement

This is one of the application's most important features.

## 16.1 Settlement Summary

Show:

-   Total meals
-   Total meal expense
-   Final meal rate
-   Total utilities
-   Other shared expenses
-   Total deposits
-   Total member-paid expenses
-   Mess fund balance

## 16.2 Member Settlement

For each member:

``` text
Member: Rahim

Meals                    82
Meal Rate                ৳69.74
Meal Cost                ৳5,718.68
Utility Share            ৳620
Extra Meal               ৳150
Other Charges            ৳100
--------------------------------
Total Payable            ৳6,588.68

Deposits                 ৳7,000
Bazar Paid by Rahim      ৳300
--------------------------------
Total Credit             ৳7,300

Final Balance            +৳711.32
```

## 16.3 Settlement Status

-   Due
-   Receivable
-   Settled
-   Carried forward

## 16.4 Close Month

Before closing, validate:

-   Meals entered for all required dates
-   Expenses reviewed
-   Bills entered
-   Deposits verified
-   Negative/invalid entries checked

After closing:

-   Freeze calculated meal rate
-   Freeze settlement snapshot
-   Carry member balances into next month
-   Allow reopening only after explicit warning

------------------------------------------------------------------------

# 17. Settlement Sharing

Even though the app is offline, reports can be generated locally and
shared using installed apps.

### Shareable formats

-   Text summary
-   Image summary
-   PDF report
-   CSV export

### Member summary

Generate a compact summary suitable for Messenger, WhatsApp, IMO, or
other messaging apps.

Example:

``` text
Mess Manager BD
October 2026 Settlement

Rahim
Meals: 82
Meal Rate: ৳69.74
Meal Cost: ৳5,718.68
Other Charges: ৳870
Total: ৳6,588.68
Deposited/Credit: ৳7,300
Balance: ৳711.32 receivable
```

------------------------------------------------------------------------

# 18. Reports

## 18.1 Monthly Summary

-   Total meals
-   Meal rate
-   Total বাজার
-   Total utilities
-   Other expenses
-   Total deposits
-   Member balances

## 18.2 Member Report

-   Meals
-   Guest meals
-   Deposits
-   Personal expenses paid
-   Charges
-   Balance
-   Month-by-month history

## 18.3 Expense Report

-   Date-wise
-   Category-wise
-   Payer-wise
-   Meal vs non-meal expenses

## 18.4 Meal Report

-   Daily meals
-   Member-wise meals
-   Guest meals
-   Average meals/day

## 18.5 Deposit Report

-   Member-wise
-   Date-wise
-   Payment-method-wise

------------------------------------------------------------------------

# 19. Search, Filter and History

Provide consistent filtering across records.

### Search

-   Member name
-   Expense description
-   Category
-   Notes

### Filters

-   Date range
-   Member
-   Category
-   Payment method
-   Record type
-   Month

### Recent activity

Show recent actions such as:

-   Meal entry updated
-   বাজার added
-   Deposit added
-   Bill paid
-   Adjustment created

------------------------------------------------------------------------

# 20. Local Notifications and Reminders

Notifications operate locally and do not require a server.

Examples:

-   Today's meals have not been entered
-   Electricity bill due tomorrow
-   Member deposit reminder
-   Month-end settlement reminder
-   Backup reminder

The manager can configure reminder time and enable/disable each type.

------------------------------------------------------------------------

# 21. Offline Data Storage

All application data is stored on the device.

### Local data includes

-   Mess information
-   Members
-   Meals
-   Guest meals
-   Expenses
-   Bills
-   Deposits
-   Adjustments
-   Monthly settlements
-   Settings
-   Locally attached receipts/photos

### Requirements

-   No internet required for core functionality
-   No mandatory registration
-   No remote database
-   Fast local querying
-   Transaction-safe financial updates
-   Database migrations between app versions

------------------------------------------------------------------------

# 22. Backup, Restore, Import and Export

Because one phone contains the entire mess history, backup is essential.

## MVP

-   Create local backup file
-   Restore backup file
-   Export backup to device storage
-   Share backup using Android/iOS share sheet
-   Backup date/version information
-   Confirm before overwriting existing data

## Advanced

Optional integration with:

-   Google Drive
-   OneDrive
-   Dropbox

Cloud storage should be used only for encrypted backup/sync files; the
application still remains local-first and does not require its own
backend.

------------------------------------------------------------------------

# 23. Security and Privacy

## App Lock

-   PIN
-   Biometric unlock where supported
-   Auto-lock after inactivity

## Sensitive operations

Require confirmation for:

-   Delete member
-   Delete expense
-   Delete deposit
-   Reopen closed month
-   Restore backup
-   Reset app data

## Privacy

-   Data remains on the manager's device by default
-   No account required
-   No analytics containing financial data by default
-   Receipt/photos remain local unless explicitly exported/backed up

------------------------------------------------------------------------

# 24. Language and Localization

Support:

-   বাংলা
-   English

Examples:

  English          বাংলা
  ---------------- ---------------
  Meals            মিল
  Market/Grocery   বাজার
  Deposit          জমা
  Expense          খরচ
  Meal Rate        মিল রেট
  Due              বাকি
  Utility Bill     ইউটিলিটি বিল
  Settlement       হিসাব নিষ্পত্তি

The user should be able to switch language without restarting the app.

------------------------------------------------------------------------

# 25. Bangladesh-Specific Formatting

-   Currency: ৳
-   BDT number formatting
-   Bangla/English numerals where appropriate
-   Local date formatting
-   bKash/Nagad/Rocket as deposit record methods
-   Common Bangladesh mess terminology

------------------------------------------------------------------------

# 26. Data Validation and Accounting Safety

Financial records need strong validation.

### Examples

-   Amount cannot be negative unless the transaction type permits it
-   Meal quantity cannot be negative
-   Warn when deleting a record affecting a closed settlement
-   Prevent accidental duplicate deposit
-   Warn about unusually large amounts
-   Ensure expense totals and settlement totals reconcile
-   Display calculation breakdown instead of hidden calculations

------------------------------------------------------------------------

# 27. Common UI States

Design reusable states for:

-   Initial loading
-   Empty member list
-   Empty meal list
-   No meals entered today
-   Empty expense list
-   Empty deposit list
-   No search results
-   Save successful
-   Save failed
-   Delete confirmation
-   Unsaved changes
-   Month already closed
-   Backup in progress
-   Backup successful
-   Backup failed
-   Restore confirmation
-   Restore successful
-   Invalid backup file
-   Database migration
-   Storage permission problem
-   Insufficient device storage

------------------------------------------------------------------------

# 28. Advanced Features / Future Releases

These are useful after the core offline accounting experience is stable.

## 28.1 Multiple Mess Profiles

Manage more than one mess on the same phone.

Examples:

-   University Hall Mess
-   Office Bachelor Mess
-   Family Shared Flat

Each mess has completely separate records.

## 28.2 Meal Calendar

Monthly calendar showing:

-   Total meals/day
-   Missing entries
-   Special meals
-   Guest meals

## 28.3 Meal-Off Scheduling

Allow future meal-off entries.

Example:

``` text
Rahim
Meal off:
Friday dinner → Sunday breakfast
```

The daily meal sheet automatically reflects scheduled meal-offs.

## 28.4 Recurring Bills

Automatically prepare expected monthly entries for:

-   Wi-Fi
-   Maid
-   Cook
-   Rent-related common charge
-   Service charge

The manager confirms the actual amount before posting.

## 28.5 Budget and Expense Insights

-   Monthly food budget
-   Budget remaining
-   Average daily বাজার
-   Expense category trends
-   Meal-rate trend
-   Month-to-month comparison

## 28.6 Smart Warnings

Examples:

-   Meal rate is significantly higher than last month
-   Grocery spending increased sharply
-   Deposit may be duplicated
-   A member has a large outstanding due
-   Today's meals are unusually different from normal

These can use local rules and do not require AI or internet.

## 28.7 Local Receipt Management

-   Attach receipt photo
-   Crop/compress image
-   View from expense
-   Delete attachment
-   Include/exclude attachments from backup

## 28.8 Audit History

Maintain a local history for important changes:

-   Old value
-   New value
-   Date/time
-   Record affected

Useful for diagnosing accidental edits.

------------------------------------------------------------------------

# 29. Suggested MVP Scope

For the first production release, prioritize:

1.  Mess setup
2.  Member management
3.  Daily meal entry
4.  Guest meals
5.  বাজার expenses
6.  Other/shared expenses
7.  Utility bills
8.  Member deposits
9.  Member-paid বাজার tracking
10. Meal-rate calculation
11. Individual balance
12. Monthly accounting periods
13. Monthly settlement
14. Dashboard
15. Basic reports
16. Shareable settlement summary
17. Bangla + English
18. Local database
19. Local backup/restore
20. PIN/biometric protection
21. Local reminders
22. Common UI/error states

This scope is enough to replace the notebook, calculator, or spreadsheet
commonly used by a mess manager while keeping the first version
manageable.

------------------------------------------------------------------------

# 30. Recommended Core Data Entities

The detailed technical design can later refine these entities, but the
feature set naturally maps to:

-   Mess
-   Member
-   AccountingMonth
-   DailyMeal
-   MemberMeal
-   GuestMeal
-   SpecialMeal
-   Expense
-   ExpenseCategory
-   UtilityBill
-   Deposit
-   MemberAdjustment
-   Settlement
-   MemberSettlement
-   Attachment
-   Reminder
-   AppSettings
-   BackupMetadata

------------------------------------------------------------------------

# 31. Key Product Success Criteria

The app should allow a typical manager to:

-   Enter an entire day's meals in under a minute
-   Record a বাজার expense in a few seconds
-   Immediately see the current approximate meal rate
-   Know exactly how much each member deposited
-   Know who owes money and who should receive money
-   Produce month-end settlement without a calculator or spreadsheet
-   Explain every calculated amount from underlying records
-   Use all essential features without internet
-   Recover data from a backup if the phone/app is lost or reinstalled
