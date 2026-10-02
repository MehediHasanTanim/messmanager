# Contributing to Mess Manager BD

## Branches and pull requests

- `main` is always releasable and protected by CI.
- Create short-lived branches from `main`: `feature/<topic>`, `fix/<topic>`,
  `chore/<topic>`, or `docs/<topic>`.
- Keep each pull request focused. Rebase or merge the latest `main` before
  requesting review.
- Do not commit generated build output, signing files, secrets, backups, or
  real financial data.

## Commit messages

Use Conventional Commits:

```text
feat(meals): add daily meal sheet validation
fix(settlement): allocate rounding remainder deterministically
docs: explain backup compatibility checks
test(finance): cover member-paid market expense
chore: update Flutter toolchain
```

## Code conventions

- Run `dart format` rather than hand-formatting Dart.
- Follow `analysis_options.yaml`; do not suppress a lint without a short,
  local reason.
- Use `lower_snake_case` for files, `UpperCamelCase` for types, and
  `lowerCamelCase` for members.
- Keep a feature in `data`, `domain`, and `presentation` layers as it grows.
- Depend inward: presentation may call use cases; domain must not import
  Flutter, Drift, or platform code.
- Store money as integer minor units and meal quantities as scaled integers.
- All user-facing strings must be localizable in English and বাংলা.

## Definition of done

Every feature change includes, where applicable:

- implementation and validation;
- localized strings;
- unit and/or widget tests;
- error, loading, and empty states;
- accessible labels, contrast, and touch targets;
- closed-month and accounting-integrity safeguards;
- Android and iOS verification;
- updated documentation when behaviour, architecture, or setup changes.

Run this verification set before opening a pull request:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```
