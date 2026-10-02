import 'package:flutter/foundation.dart';

import '../../app/config/app_environment.dart';

/// Emits operational events only; it deliberately accepts no user or finance data.
class AppLogger {
  const AppLogger();

  void debug(String event) {
    if (AppEnvironment.current.isDevelopment && kDebugMode) {
      debugPrint('[MessManagerBD][DEBUG] $event');
    }
  }

  void info(String event) {
    if (AppEnvironment.current.isDevelopment) {
      debugPrint('[MessManagerBD][INFO] $event');
    }
  }

  void error(String event, Object error, StackTrace stackTrace) {
    if (AppEnvironment.current.isDevelopment) {
      debugPrint('[MessManagerBD][ERROR] $event: ${error.runtimeType}');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
