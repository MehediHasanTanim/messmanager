# Development guide

## Toolchain

| Component | Baseline |
| --- | --- |
| Flutter | 3.47.2 stable |
| Dart | 3.13.2 (`>=3.13.2 <3.14.0`) |
| Android SDK | 36.0.0 or later |
| Java | 17 |
| Xcode | 26.5 or later |
| CocoaPods | 1.16.2 or later |

Flutter and Dart versions are deliberately documented and the Dart SDK range is
locked in `pubspec.yaml`. Update both through a reviewed chore when upgrading.

## Application identity and versioning

| Setting | Value |
| --- | --- |
| Android application ID | `com.mehedihasantanim.messmanagerbd` |
| iOS bundle identifier | `com.mehedihasantanim.messmanagerbd` |
| Display name | `Mess Manager BD` |
| Version format | `MAJOR.MINOR.PATCH+BUILD` |

`version` in `pubspec.yaml` supplies Android `versionName`/`versionCode` and
iOS `CFBundleShortVersionString`/`CFBundleVersion`. Increment the build number
for every store upload; increment semantic version components for the user
visible release.

## Environments

The app uses a compile-time `APP_ENV` value. Development is the safe default;
only `production` enables production mode.

```bash
# Development
flutter run --dart-define=APP_ENV=development

# Production-like local run
flutter run --release --dart-define=APP_ENV=production

# Android release bundle
flutter build appbundle --dart-define=APP_ENV=production

# iOS release build
flutter build ipa --dart-define=APP_ENV=production
```

Environment selection must never contain credentials or financial data. Add
secrets through platform/CI secret stores, not through `--dart-define` or Git.

## Set up and run

```bash
flutter doctor -v
flutter pub get
flutter run --dart-define=APP_ENV=development
```

For iOS, open `ios/Runner.xcworkspace` after `flutter pub get` when native
signing or device settings are needed. For Android, use Android Studio or a
connected device/emulator selected by `flutter devices`.

## Quality commands

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
flutter build apk --debug --dart-define=APP_ENV=development
flutter build ios --no-codesign --dart-define=APP_ENV=development
```

## Platform verification status

The repository baseline was checked with `flutter doctor -v`: Android SDK,
Xcode, CocoaPods, Chrome, macOS, and the Flutter toolchain are available.
Physical Android and iPhone verification still requires the respective device
to be connected and selected; that cannot be substituted by a desktop build.

## Signing

Release signing material is intentionally not in this repository. Android
keystores and `android/key.properties`, as well as iOS export options, are
ignored by Git. Configure them only in a secure local or CI environment before
store release.
