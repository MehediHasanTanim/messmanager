import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/logging/app_logger.dart';

final appLoggerProvider = Provider<AppLogger>((ref) => const AppLogger());

final appAccessStateProvider = Provider<AppAccessState>(
  (ref) => const AppAccessState(),
);

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

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
