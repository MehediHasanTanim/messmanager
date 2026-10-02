import 'package:local_auth/local_auth.dart';

enum BiometricAvailability { available, unavailable, notEnrolled, failure }

abstract interface class BiometricAuthenticator {
  Future<BiometricAvailability> availability();
  Future<bool> authenticate(String reason);
}

class LocalBiometricAuthenticator implements BiometricAuthenticator {
  LocalBiometricAuthenticator([LocalAuthentication? localAuth])
    : _localAuth = localAuth ?? LocalAuthentication();

  final LocalAuthentication _localAuth;

  @override
  Future<BiometricAvailability> availability() async {
    try {
      if (!await _localAuth.isDeviceSupported() ||
          !await _localAuth.canCheckBiometrics) {
        return BiometricAvailability.unavailable;
      }
      final available = await _localAuth.getAvailableBiometrics();
      return available.isEmpty
          ? BiometricAvailability.notEnrolled
          : BiometricAvailability.available;
    } on LocalAuthException {
      return BiometricAvailability.failure;
    }
  }

  @override
  Future<bool> authenticate(String reason) async {
    try {
      return await _localAuth.authenticate(localizedReason: reason);
    } on LocalAuthException {
      return false;
    }
  }
}
