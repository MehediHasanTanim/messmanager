import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/providers/app_providers.dart';
import '../../../app/router/app_router.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/security/biometric_service.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/app_fields.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../domain/onboarding_use_cases.dart';
import 'onboarding_state.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final destination = ref.watch(startupDestinationProvider);
    ref.listen(startupDestinationProvider, (_, next) {
      next.whenData((value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          switch (value) {
            case StartupDestination.setup:
              context.go(AppRoutes.language);
            case StartupDestination.lock:
              context.go(AppRoutes.lock);
            case StartupDestination.home:
              context.go(AppRoutes.home);
          }
        });
      });
    });
    return Scaffold(
      body: Center(
        child: destination.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => _SetupFrame(
            icon: Icons.error_outline,
            title: l10n.startupFailed,
            message: l10n.startupFailedMessage,
            child: const SizedBox.shrink(),
          ),
          data: (_) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class LanguageSelectionPage extends ConsumerWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selected = ref.watch(localeProvider);
    return _SetupFrame(
      icon: Icons.translate_rounded,
      title: l10n.chooseLanguage,
      message: l10n.welcomeMessage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _LanguageChoice(
            title: l10n.languageBangla,
            subtitle: 'বাংলা',
            selected: selected.languageCode == 'bn',
            onTap: () =>
                ref.read(localeProvider.notifier).setLocale(const Locale('bn')),
          ),
          const SizedBox(height: AppSpacing.sm),
          _LanguageChoice(
            title: l10n.languageEnglish,
            subtitle: 'English',
            selected: selected.languageCode == 'en',
            onTap: () =>
                ref.read(localeProvider.notifier).setLocale(const Locale('en')),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: l10n.continueLabel,
            onPressed: () => context.go(AppRoutes.welcome),
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.home_work_outlined,
      title: l10n.welcome,
      message: l10n.welcomeMessage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppPrimaryButton(
            label: l10n.setupMess,
            icon: Icons.add_home_outlined,
            onPressed: () => context.go(AppRoutes.createMess),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppSecondaryButton(
            label: l10n.restoreBackup,
            icon: Icons.restore_outlined,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class CreateMessPage extends ConsumerStatefulWidget {
  const CreateMessPage({super.key});

  @override
  ConsumerState<CreateMessPage> createState() => _CreateMessPageState();
}

class _CreateMessPageState extends ConsumerState<CreateMessPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _address;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(onboardingDraftProvider);
    _name = TextEditingController(text: draft.messName);
    _address = TextEditingController(text: draft.address);
  }

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.home_work_outlined,
      title: l10n.setupMess,
      message: l10n.createMessMessage,
      showBack: true,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: l10n.messName,
              controller: _name,
              textInputAction: TextInputAction.next,
              validator: (value) => _required(value, l10n.required),
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(label: l10n.address, controller: _address),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: l10n.continueLabel,
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final current = ref.read(onboardingDraftProvider);
                ref
                    .read(onboardingDraftProvider.notifier)
                    .update(
                      current.copyWith(
                        messName: _name.text,
                        address: _address.text,
                      ),
                    );
                context.go(AppRoutes.manager);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerSetupPage extends ConsumerStatefulWidget {
  const ManagerSetupPage({super.key});

  @override
  ConsumerState<ManagerSetupPage> createState() => _ManagerSetupPageState();
}

class _ManagerSetupPageState extends ConsumerState<ManagerSetupPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(onboardingDraftProvider);
    _name = TextEditingController(text: draft.managerName);
    _phone = TextEditingController(text: draft.phone);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.manage_accounts_outlined,
      title: l10n.managerName,
      message: l10n.managerMessage,
      showBack: true,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: l10n.managerName,
              controller: _name,
              textInputAction: TextInputAction.next,
              validator: (value) => _required(value, l10n.required),
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(label: l10n.phone, controller: _phone),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: l10n.continueLabel,
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final current = ref.read(onboardingDraftProvider);
                ref
                    .read(onboardingDraftProvider.notifier)
                    .update(
                      current.copyWith(
                        managerName: _name.text,
                        phone: _phone.text,
                      ),
                    );
                context.go(AppRoutes.monthSetup);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountingMonthSetupPage extends ConsumerStatefulWidget {
  const AccountingMonthSetupPage({super.key});

  @override
  ConsumerState<AccountingMonthSetupPage> createState() =>
      _AccountingMonthSetupPageState();
}

class _AccountingMonthSetupPageState
    extends ConsumerState<AccountingMonthSetupPage> {
  DateTime _date = DateTime(DateTime.now().year, DateTime.now().month, 1);
  bool _saving = false;

  Future<void> _complete() async {
    setState(() => _saving = true);
    final draft = ref.read(onboardingDraftProvider);
    final now = DateTime.now().microsecondsSinceEpoch;
    try {
      await CompleteOnboarding(ref.read(appDatabaseProvider))(
        messId: 'mess-$now',
        accountingMonthId: 'month-$now',
        mess: MessDraft(
          name: draft.messName,
          address: draft.address,
          managerName: draft.managerName,
          managerPhone: draft.phone,
          languageCode: ref.read(localeProvider).languageCode,
        ),
        startDate: _date,
      );
      ref
          .read(onboardingDraftProvider.notifier)
          .update(draft.copyWith(startDate: _date));
      if (mounted) {
        context.go(AppRoutes.setupComplete);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.setupSaveFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final formatted = DateFormat.yMMMM(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(_date);
    return _SetupFrame(
      icon: Icons.calendar_month_outlined,
      title: l10n.month,
      message: l10n.monthMessage,
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text('${l10n.startDate}: $formatted'),
            onPressed: _saving
                ? null
                : () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (selected != null) {
                      setState(
                        () =>
                            _date = DateTime(selected.year, selected.month, 1),
                      );
                    }
                  },
          ),
          const SizedBox(height: AppSpacing.lg),
          AppPrimaryButton(
            label: _saving ? '…' : l10n.continueLabel,
            onPressed: _saving ? null : _complete,
          ),
        ],
      ),
    );
  }
}

class SetupCompletePage extends StatelessWidget {
  const SetupCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.check_circle_outline,
      title: l10n.setupComplete,
      message: l10n.secureMess,
      child: AppPrimaryButton(
        label: l10n.createPin,
        icon: Icons.lock_outline,
        onPressed: () => context.go(AppRoutes.createPin),
      ),
    );
  }
}

class CreatePinPage extends ConsumerStatefulWidget {
  const CreatePinPage({super.key});

  @override
  ConsumerState<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends ConsumerState<CreatePinPage> {
  final _formKey = GlobalKey<FormState>();
  final _pin = TextEditingController();

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.lock_outline,
      title: l10n.createPin,
      message: l10n.pinMessage,
      showBack: true,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PinField(
              controller: _pin,
              label: l10n.createPin,
              validator: (value) => _validPin(value, l10n.invalidPin),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: l10n.continueLabel,
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                final current = ref.read(onboardingDraftProvider);
                ref
                    .read(onboardingDraftProvider.notifier)
                    .update(current.copyWith(pin: _pin.text));
                context.go(AppRoutes.confirmPin);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPinPage extends ConsumerStatefulWidget {
  const ConfirmPinPage({super.key});

  @override
  ConsumerState<ConfirmPinPage> createState() => _ConfirmPinPageState();
}

class _ConfirmPinPageState extends ConsumerState<ConfirmPinPage> {
  final _formKey = GlobalKey<FormState>();
  final _pin = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _confirm() async {
    final l10n = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (_pin.text != ref.read(onboardingDraftProvider).pin) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.pinMismatch)));
      return;
    }
    setState(() => _saving = true);
    await ref.read(pinServiceProvider).setPin(_pin.text);
    if (mounted) context.go(AppRoutes.biometrics);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.verified_user_outlined,
      title: l10n.confirmPin,
      message: l10n.confirmPinMessage,
      showBack: true,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PinField(
              controller: _pin,
              label: l10n.confirmPin,
              validator: (value) => _validPin(value, l10n.invalidPin),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppPrimaryButton(
              label: _saving ? '…' : l10n.continueLabel,
              onPressed: _saving ? null : _confirm,
            ),
          ],
        ),
      ),
    );
  }
}

class BiometricSetupPage extends ConsumerWidget {
  const BiometricSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final biometric = ref.read(biometricAuthenticatorProvider);
    return FutureBuilder<BiometricAvailability>(
      future: biometric.availability(),
      builder: (context, snapshot) {
        final availability = snapshot.data ?? BiometricAvailability.failure;
        final message = switch (availability) {
          BiometricAvailability.available => l10n.biometricMessage,
          BiometricAvailability.unavailable => l10n.biometricUnavailable,
          BiometricAvailability.notEnrolled => l10n.biometricNotEnrolled,
          BiometricAvailability.failure => l10n.biometricFailure,
        };
        return _SetupFrame(
          icon: Icons.fingerprint,
          title: l10n.enableBiometrics,
          message: message,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (availability == BiometricAvailability.available)
                AppPrimaryButton(
                  label: l10n.enable,
                  icon: Icons.fingerprint,
                  onPressed: () async {
                    final approved = await biometric.authenticate(
                      l10n.enableBiometrics,
                    );
                    if (approved) {
                      await ref
                          .read(pinServiceProvider)
                          .setBiometricsEnabled(true);
                    }
                    if (context.mounted) {
                      context.go(AppRoutes.home);
                    }
                  },
                ),
              if (availability == BiometricAvailability.available)
                const SizedBox(height: AppSpacing.sm),
              AppSecondaryButton(
                label: availability == BiometricAvailability.available
                    ? l10n.notNow
                    : l10n.finish,
                onPressed: () => context.go(AppRoutes.home),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppLockPage extends ConsumerStatefulWidget {
  const AppLockPage({super.key});

  @override
  ConsumerState<AppLockPage> createState() => _AppLockPageState();
}

class _AppLockPageState extends ConsumerState<AppLockPage> {
  final _formKey = GlobalKey<FormState>();
  final _pin = TextEditingController();
  bool _failed = false;

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _unlock() async {
    if (!_formKey.currentState!.validate()) return;
    final valid = await ref.read(pinServiceProvider).verifyPin(_pin.text);
    if (!mounted) return;
    if (valid) {
      context.go(AppRoutes.home);
    } else {
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.lock_outline,
      title: l10n.appLock,
      message: l10n.lockMessage,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PinField(
              controller: _pin,
              label: l10n.createPin,
              validator: (value) => _validPin(value, l10n.invalidPin),
            ),
            if (_failed)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm),
                child: Text(
                  l10n.invalidPin,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            FutureBuilder<bool>(
              future: ref.read(pinServiceProvider).biometricsEnabled(),
              builder: (context, snapshot) => snapshot.data == true
                  ? AppSecondaryButton(
                      label: l10n.enableBiometrics,
                      icon: Icons.fingerprint,
                      onPressed: () async {
                        final valid = await ref
                            .read(biometricAuthenticatorProvider)
                            .authenticate(l10n.unlock);
                        if (valid && context.mounted) {
                          context.go(AppRoutes.home);
                        }
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppPrimaryButton(label: l10n.unlock, onPressed: _unlock),
            TextButton(
              onPressed: () => context.go(AppRoutes.recovery),
              child: Text(l10n.pinForgotten),
            ),
          ],
        ),
      ),
    );
  }
}

class RecoveryGuidancePage extends StatelessWidget {
  const RecoveryGuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _SetupFrame(
      icon: Icons.health_and_safety_outlined,
      title: l10n.recoveryGuidance,
      message: l10n.recoveryMessage,
      showBack: true,
      child: AppPrimaryButton(
        label: l10n.back,
        onPressed: () => context.go(AppRoutes.lock),
      ),
    );
  }
}

class _SetupFrame extends StatelessWidget {
  const _SetupFrame({
    required this.icon,
    required this.title,
    required this.message,
    required this.child,
    this.showBack = false,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget child;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBack
          ? AppBar(leading: BackButton(onPressed: () => context.pop()))
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: 44,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        message,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageChoice extends StatelessWidget {
  const _LanguageChoice({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    child: OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        side: BorderSide(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text(subtitle)],
            ),
          ),
          if (selected) const Icon(Icons.check_circle),
        ],
      ),
    ),
  );
}

class _PinField extends StatelessWidget {
  const _PinField({
    required this.controller,
    required this.label,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    obscureText: true,
    keyboardType: TextInputType.number,
    maxLength: 8,
    validator: validator,
  );
}

String? _required(String? value, String message) =>
    value == null || value.trim().isEmpty ? message : null;
String? _validPin(String? value, String message) =>
    value == null || !RegExp(r'^\d{4,8}$').hasMatch(value) ? message : null;
