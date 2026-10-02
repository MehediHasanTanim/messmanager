enum AppEnvironment {
  development,
  production;

  static const _value = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );

  static AppEnvironment get current => switch (_value) {
    'production' => AppEnvironment.production,
    _ => AppEnvironment.development,
  };

  bool get isDevelopment => this == AppEnvironment.development;

  String get label => switch (this) {
    AppEnvironment.development => 'Development',
    AppEnvironment.production => 'Production',
  };
}
