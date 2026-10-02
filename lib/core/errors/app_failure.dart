sealed class AppFailure implements Exception {
  const AppFailure(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => '$runtimeType: $message';
}

class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message, {super.cause});
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message, {super.cause});
}

class FileFailure extends AppFailure {
  const FileFailure(super.message, {super.cause});
}

class SecurityFailure extends AppFailure {
  const SecurityFailure(super.message, {super.cause});
}

class SettlementFailure extends AppFailure {
  const SettlementFailure(super.message, {super.cause});
}
