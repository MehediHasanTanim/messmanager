import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Mess Manager BD'**
  String get appTitle;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @setupMess.
  ///
  /// In en, this message translates to:
  /// **'Set Up My Mess'**
  String get setupMess;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore Existing Backup'**
  String get restoreBackup;

  /// No description provided for @messName.
  ///
  /// In en, this message translates to:
  /// **'Mess name'**
  String get messName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Area / address'**
  String get address;

  /// No description provided for @managerName.
  ///
  /// In en, this message translates to:
  /// **'Manager name'**
  String get managerName;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Accounting month'**
  String get month;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @createPin.
  ///
  /// In en, this message translates to:
  /// **'Create App PIN'**
  String get createPin;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match. Try again.'**
  String get pinMismatch;

  /// No description provided for @enableBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Enable biometrics'**
  String get enableBiometrics;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @pinForgotten.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN?'**
  String get pinForgotten;

  /// No description provided for @recoveryGuidance.
  ///
  /// In en, this message translates to:
  /// **'PIN Recovery Guidance'**
  String get recoveryGuidance;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @meal.
  ///
  /// In en, this message translates to:
  /// **'Meal'**
  String get meal;

  /// No description provided for @market.
  ///
  /// In en, this message translates to:
  /// **'Market / Grocery'**
  String get market;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @due.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get due;

  /// No description provided for @settlement.
  ///
  /// In en, this message translates to:
  /// **'Settlement'**
  String get settlement;

  /// No description provided for @utility.
  ///
  /// In en, this message translates to:
  /// **'Utility bill'**
  String get utility;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get required;

  /// No description provided for @invalidPin.
  ///
  /// In en, this message translates to:
  /// **'Enter a 4 to 8 digit PIN.'**
  String get invalidPin;

  /// No description provided for @setupComplete.
  ///
  /// In en, this message translates to:
  /// **'Everything is ready!'**
  String get setupComplete;

  /// No description provided for @lockMessage.
  ///
  /// In en, this message translates to:
  /// **'Unlock to continue managing your mess.'**
  String get lockMessage;

  /// No description provided for @languageBangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get languageBangla;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Keep meals, expenses, deposits and balances clear for everyone.'**
  String get welcomeMessage;

  /// No description provided for @createMessMessage.
  ///
  /// In en, this message translates to:
  /// **'Tell us a little about the mess you manage.'**
  String get createMessMessage;

  /// No description provided for @managerMessage.
  ///
  /// In en, this message translates to:
  /// **'This person will manage the initial records.'**
  String get managerMessage;

  /// No description provided for @monthMessage.
  ///
  /// In en, this message translates to:
  /// **'Choose the month in which you want to start keeping accounts.'**
  String get monthMessage;

  /// No description provided for @secureMess.
  ///
  /// In en, this message translates to:
  /// **'Keep your mess private'**
  String get secureMess;

  /// No description provided for @pinMessage.
  ///
  /// In en, this message translates to:
  /// **'Use a 4 to 8 digit PIN. It is stored securely on this device.'**
  String get pinMessage;

  /// No description provided for @confirmPinMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter the same PIN once more to protect the app.'**
  String get confirmPinMessage;

  /// No description provided for @biometricMessage.
  ///
  /// In en, this message translates to:
  /// **'Use your device biometrics for a quicker, secure unlock. PIN will always remain available.'**
  String get biometricMessage;

  /// No description provided for @biometricUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Biometrics are not available on this device. You can continue with your PIN.'**
  String get biometricUnavailable;

  /// No description provided for @biometricNotEnrolled.
  ///
  /// In en, this message translates to:
  /// **'No biometrics are enrolled on this device. You can add them later in device settings.'**
  String get biometricNotEnrolled;

  /// No description provided for @biometricFailure.
  ///
  /// In en, this message translates to:
  /// **'We could not check biometrics right now. Your PIN remains available.'**
  String get biometricFailure;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @recoveryMessage.
  ///
  /// In en, this message translates to:
  /// **'For your privacy, the PIN cannot be recovered. If you forget it, restore a trusted backup after resetting the app. Keep your backup file in a safe place.'**
  String get recoveryMessage;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @appLock.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get appLock;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open device settings'**
  String get openSettings;

  /// No description provided for @startupFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to start the app'**
  String get startupFailed;

  /// No description provided for @startupFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Please restart Mess Manager BD.'**
  String get startupFailedMessage;

  /// No description provided for @setupSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to save setup. Please try again.'**
  String get setupSaveFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
