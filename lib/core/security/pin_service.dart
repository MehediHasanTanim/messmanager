import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class SecureKeyValueStore {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
}

class FlutterSecureKeyValueStore implements SecureKeyValueStore {
  const FlutterSecureKeyValueStore([
    this._storage = const FlutterSecureStorage(),
  ]);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);
}

class PinService {
  PinService(this._store, {Random? random})
    : _random = random ?? Random.secure();

  static const _saltKey = 'security.pin.salt';
  static const _hashKey = 'security.pin.hash';
  static const _biometricsEnabledKey = 'security.biometrics.enabled';
  final SecureKeyValueStore _store;
  final Random _random;

  Future<void> setPin(String pin) async {
    _validate(pin);
    final salt = List<int>.generate(32, (_) => _random.nextInt(256));
    await _store.write(_saltKey, base64UrlEncode(salt));
    await _store.write(_hashKey, _hash(pin, salt));
  }

  Future<bool> hasPin() async => (await _store.read(_hashKey)) != null;

  Future<void> setBiometricsEnabled(bool enabled) {
    return _store.write(_biometricsEnabledKey, enabled.toString());
  }

  Future<bool> biometricsEnabled() async {
    return (await _store.read(_biometricsEnabledKey)) == 'true';
  }

  Future<bool> verifyPin(String pin) async {
    final encodedSalt = await _store.read(_saltKey);
    final expected = await _store.read(_hashKey);
    if (encodedSalt == null || expected == null) return false;
    final actual = _hash(pin, base64Url.decode(encodedSalt));
    return _constantTimeEquals(expected, actual);
  }

  void _validate(String pin) {
    if (!RegExp(r'^\d{4,8}$').hasMatch(pin)) {
      throw ArgumentError.value(pin, 'pin', 'PIN must contain 4 to 8 digits.');
    }
  }

  String _hash(String pin, List<int> salt) {
    var bytes = [...salt, ...utf8.encode(pin)];
    for (var iteration = 0; iteration < 120000; iteration++) {
      bytes = sha256.convert(bytes).bytes;
    }
    return base64UrlEncode(bytes);
  }

  bool _constantTimeEquals(String left, String right) {
    if (left.length != right.length) return false;
    var difference = 0;
    for (var index = 0; index < left.length; index++) {
      difference |= left.codeUnitAt(index) ^ right.codeUnitAt(index);
    }
    return difference == 0;
  }
}
