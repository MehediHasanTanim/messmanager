// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Mess Manager BD';

  @override
  String get chooseLanguage => 'Choose Language';

  @override
  String get continueLabel => 'Continue';

  @override
  String get welcome => 'Welcome';

  @override
  String get setupMess => 'Set Up My Mess';

  @override
  String get restoreBackup => 'Restore Existing Backup';

  @override
  String get messName => 'Mess name';

  @override
  String get address => 'Area / address';

  @override
  String get managerName => 'Manager name';

  @override
  String get phone => 'Phone number';

  @override
  String get month => 'Accounting month';

  @override
  String get startDate => 'Start date';

  @override
  String get createPin => 'Create App PIN';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get pinMismatch => 'PINs do not match. Try again.';

  @override
  String get enableBiometrics => 'Enable biometrics';

  @override
  String get notNow => 'Not now';

  @override
  String get unlock => 'Unlock';

  @override
  String get pinForgotten => 'Forgot PIN?';

  @override
  String get recoveryGuidance => 'PIN Recovery Guidance';

  @override
  String get save => 'Save';

  @override
  String get meal => 'Meal';

  @override
  String get market => 'Market / Grocery';

  @override
  String get deposit => 'Deposit';

  @override
  String get due => 'Due';

  @override
  String get settlement => 'Settlement';

  @override
  String get utility => 'Utility bill';

  @override
  String get balance => 'Balance';

  @override
  String get required => 'This field is required.';

  @override
  String get invalidPin => 'Enter a 4 to 8 digit PIN.';

  @override
  String get setupComplete => 'Everything is ready!';

  @override
  String get lockMessage => 'Unlock to continue managing your mess.';

  @override
  String get languageBangla => 'বাংলা';

  @override
  String get languageEnglish => 'English';

  @override
  String get welcomeMessage =>
      'Keep meals, expenses, deposits and balances clear for everyone.';

  @override
  String get createMessMessage => 'Tell us a little about the mess you manage.';

  @override
  String get managerMessage => 'This person will manage the initial records.';

  @override
  String get monthMessage =>
      'Choose the month in which you want to start keeping accounts.';

  @override
  String get secureMess => 'Keep your mess private';

  @override
  String get pinMessage =>
      'Use a 4 to 8 digit PIN. It is stored securely on this device.';

  @override
  String get confirmPinMessage =>
      'Enter the same PIN once more to protect the app.';

  @override
  String get biometricMessage =>
      'Use your device biometrics for a quicker, secure unlock. PIN will always remain available.';

  @override
  String get biometricUnavailable =>
      'Biometrics are not available on this device. You can continue with your PIN.';

  @override
  String get biometricNotEnrolled =>
      'No biometrics are enrolled on this device. You can add them later in device settings.';

  @override
  String get biometricFailure =>
      'We could not check biometrics right now. Your PIN remains available.';

  @override
  String get enable => 'Enable';

  @override
  String get finish => 'Finish';

  @override
  String get tryAgain => 'Try again';

  @override
  String get recoveryMessage =>
      'For your privacy, the PIN cannot be recovered. If you forget it, restore a trusted backup after resetting the app. Keep your backup file in a safe place.';

  @override
  String get back => 'Back';

  @override
  String get appLock => 'App lock';

  @override
  String get openSettings => 'Open device settings';

  @override
  String get startupFailed => 'Unable to start the app';

  @override
  String get startupFailedMessage => 'Please restart Mess Manager BD.';

  @override
  String get setupSaveFailed => 'Unable to save setup. Please try again.';
}
