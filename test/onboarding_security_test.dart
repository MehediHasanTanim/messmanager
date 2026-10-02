import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mess_manager_bd/app/app.dart';
import 'package:mess_manager_bd/app/providers/app_providers.dart';
import 'package:mess_manager_bd/core/database/app_database.dart';
import 'package:mess_manager_bd/core/database/database_provider.dart';
import 'package:mess_manager_bd/core/security/biometric_service.dart';
import 'package:mess_manager_bd/core/security/pin_service.dart';
import 'package:mess_manager_bd/features/onboarding/domain/onboarding_use_cases.dart';
import 'package:mess_manager_bd/features/onboarding/presentation/onboarding_state.dart';

void main() {
  group('PIN security', () {
    test('stores a salted representation and rejects a PIN mismatch', () async {
      final store = _MemorySecureStore();
      final service = PinService(store);

      await service.setPin('2468');

      expect(await service.hasPin(), isTrue);
      expect(await service.verifyPin('2468'), isTrue);
      expect(await service.verifyPin('2469'), isFalse);
      expect(store.values.values, isNot(contains('2468')));
    });

    test('rejects PINs outside the 4 to 8 digit policy', () async {
      final service = PinService(_MemorySecureStore());
      expect(service.setPin('123'), throwsArgumentError);
      expect(service.setPin('abcdefgh'), throwsArgumentError);
    });
  });

  group('onboarding persistence and startup routing', () {
    late AppDatabase database;

    setUp(() => database = AppDatabase.forTesting(NativeDatabase.memory()));
    tearDown(() => database.close());

    test('fresh installation opens setup', () async {
      final container = ProviderContainer(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          pinServiceProvider.overrideWithValue(
            PinService(_MemorySecureStore()),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        await container.read(startupDestinationProvider.future),
        StartupDestination.setup,
      );
    });

    test('existing setup with a PIN opens the app lock', () async {
      await _complete(database);
      final pinService = PinService(_MemorySecureStore());
      await pinService.setPin('2468');
      final container = ProviderContainer(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          pinServiceProvider.overrideWithValue(pinService),
        ],
      );
      addTearDown(container.dispose);

      expect(
        await container.read(startupDestinationProvider.future),
        StartupDestination.lock,
      );
    });

    test('completion creates both mess and initial accounting month', () async {
      await _complete(database);

      expect(
        (await database.select(database.messes).get()).single.name,
        'Green House',
      );
      expect(
        (await database.select(database.accountingMonths).get()).single.month,
        8,
      );
    });
  });

  testWidgets('language selection switches the runtime locale', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          startupDestinationProvider.overrideWith(
            (ref) async => StartupDestination.setup,
          ),
        ],
        child: const MessManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ভাষা নির্বাচন করুন'), findsOneWidget);
    await tester.tap(find.text('English').first);
    await tester.pump();

    expect(find.text('Choose Language'), findsOneWidget);
  });

  test('biometric fallback retains PIN access when unavailable', () async {
    const biometric = _FakeBiometricAuthenticator(
      BiometricAvailability.notEnrolled,
    );
    expect(await biometric.availability(), BiometricAvailability.notEnrolled);
    expect(await biometric.authenticate('Unlock'), isFalse);
  });
}

Future<void> _complete(AppDatabase database) {
  return CompleteOnboarding(database)(
    messId: 'mess-1',
    accountingMonthId: 'month-1',
    mess: const MessDraft(
      name: 'Green House',
      managerName: 'Rahim',
      languageCode: 'bn',
    ),
    startDate: DateTime(2025, 8, 1),
  );
}

class _MemorySecureStore implements SecureKeyValueStore {
  final values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}

class _FakeBiometricAuthenticator implements BiometricAuthenticator {
  const _FakeBiometricAuthenticator(this.result);

  final BiometricAvailability result;

  @override
  Future<bool> authenticate(String reason) async => false;

  @override
  Future<BiometricAvailability> availability() async => result;
}
