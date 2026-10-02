import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers/app_providers.dart';
import '../../../core/database/database_provider.dart';

class OnboardingDraft {
  const OnboardingDraft({
    this.messName = '',
    this.address = '',
    this.managerName = '',
    this.phone = '',
    this.startDate,
    this.pin = '',
  });

  final String messName;
  final String address;
  final String managerName;
  final String phone;
  final DateTime? startDate;
  final String pin;

  OnboardingDraft copyWith({
    String? messName,
    String? address,
    String? managerName,
    String? phone,
    DateTime? startDate,
    String? pin,
  }) => OnboardingDraft(
    messName: messName ?? this.messName,
    address: address ?? this.address,
    managerName: managerName ?? this.managerName,
    phone: phone ?? this.phone,
    startDate: startDate ?? this.startDate,
    pin: pin ?? this.pin,
  );
}

class OnboardingDraftController extends Notifier<OnboardingDraft> {
  @override
  OnboardingDraft build() => const OnboardingDraft();

  void update(OnboardingDraft draft) => state = draft;
}

final onboardingDraftProvider =
    NotifierProvider<OnboardingDraftController, OnboardingDraft>(
      OnboardingDraftController.new,
    );

enum StartupDestination { setup, lock, home }

final startupDestinationProvider = FutureProvider<StartupDestination>((
  ref,
) async {
  final database = ref.read(appDatabaseProvider);
  await database.customSelect('SELECT 1').get();
  final mess = await (database.select(
    database.messes,
  )..limit(1)).getSingleOrNull();
  if (mess == null) return StartupDestination.setup;

  ref.read(localeProvider.notifier).setLocale(Locale(mess.defaultLanguage));
  return (await ref.read(pinServiceProvider).hasPin())
      ? StartupDestination.lock
      : StartupDestination.home;
});
