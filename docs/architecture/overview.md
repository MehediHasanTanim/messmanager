# Architecture overview

## Purpose

Mess Manager BD is a local-first financial application. Accounting correctness,
data integrity, backup recovery, and traceable calculations take priority over
visual polish or feature breadth.

The approved product, UX, and technical documents under `docs/` remain the
authoritative detailed specification. In particular, `docs/UX/` supplies the
required visual layouts and icon designs.

## Target dependency direction

```text
Presentation (Flutter screens, widgets, Riverpod controllers)
        ↓
Application (use cases)
        ↓
Domain (entities, value objects, calculators, repository contracts)
        ↓
Data / infrastructure (Drift, SQLite, files, secure storage, platform APIs)
```

Domain code is pure Dart. It must not import Flutter, Drift, secure storage, or
other infrastructure packages. Infrastructure implements repository contracts;
widgets never own financial truth.

## Planned source layout

```text
lib/
  app/             # bootstrap, routing, theme, localization, configuration
  core/            # cross-cutting database, money, errors, security, storage
  features/
    <feature>/
      data/
      domain/
      presentation/
```

Features are introduced incrementally according to the approved implementation
plan. Do not create empty abstractions merely to mirror this structure.

## Non-negotiable financial rules

- Money is represented as integer minor units; never use `double` or SQLite
  `REAL` for money.
- Meal quantities are scaled integers (for example `100 == 1 meal`).
- Meal rate, allocation, balance, settlement, rounding, and carry-forward
  calculations are deterministic pure-Dart code with automated tests.
- Financial multi-record writes run in a SQLite transaction.
- Closed months are immutable to normal edits and preserve settlement snapshots.
- Every reported balance must be traceable to source records.
- Backups are validated and restored safely; an active database is never
  overwritten immediately after file selection.

## Quality and localization

English and বাংলা are first-class UI languages. Financial direction is always
communicated in text (for example, “Member owes mess”), never color alone. All
screens must provide accessible semantics and designed loading, empty, error,
and validation states.
