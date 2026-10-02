# Mess Manager BD

Mess Manager BD is an offline-first Flutter app for managing shared-mess meals,
expenses, deposits, utility bills, and monthly settlement in Bangladesh.

The app keeps its financial data on the manager's device. It does not require a
backend or internet connection for core accounting work.

## Project status

Phase 0 (project preparation) is complete. The current app is an intentionally
small, buildable foundation; product features begin in Phase 1.

## Technology baseline

- Flutter 3.47.2 (stable)
- Dart 3.13.2, constrained to `>=3.13.2 <3.14.0`
- Android and iOS targets
- Application ID / bundle ID: `com.mehedihasantanim.messmanagerbd`
- App display name: `Mess Manager BD`

See [development.md](docs/development.md) for local setup and build commands,
and [architecture/overview.md](docs/architecture/overview.md) for the
architecture contract.

## Quick start

```bash
flutter pub get
flutter run --dart-define=APP_ENV=development
```

Before opening a pull request, run:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

## Documentation

- [Product feature list](docs/feature/Mess_Manager_BD_Detailed_Feature_List.md)
- [UX specification](docs/UX/Mess_Manager_BD_UI_Screens_Detailed_Specification.md)
- [Technical design](docs/design/Mess_Manager_BD_Flutter_Technical_Design.md)
- [Implementation plan](docs/plan/Mess_Manager_BD_Flutter_Technical_Implementation_Plan.md)
- [Development guide](docs/development.md)
- [Contribution guide](CONTRIBUTING.md)

The screens and icon references under `docs/UX/` are the visual source of truth
for all implementation work.
