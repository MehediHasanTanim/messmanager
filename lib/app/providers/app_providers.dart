import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/logging/app_logger.dart';
import '../../core/security/biometric_service.dart';
import '../../core/security/pin_service.dart';

final appLoggerProvider = Provider<AppLogger>((ref) => const AppLogger());
final pinServiceProvider = Provider<PinService>(
  (ref) => PinService(const FlutterSecureKeyValueStore()),
);
final biometricAuthenticatorProvider = Provider<BiometricAuthenticator>(
  (ref) => LocalBiometricAuthenticator(),
);

final appAccessStateProvider = Provider<AppAccessState>(
  (ref) => const AppAccessState(),
);

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);
final localeProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);

class LocaleController extends Notifier<Locale> {
  @override
  Locale build() => const Locale('bn');

  void setLocale(Locale locale) => state = locale;
}

class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setMode(ThemeMode mode) {
    state = mode;
  }
}

class AppAccessState {
  const AppAccessState({this.needsSetup = false, this.isLocked = false});

  final bool needsSetup;
  final bool isLocked;
}
