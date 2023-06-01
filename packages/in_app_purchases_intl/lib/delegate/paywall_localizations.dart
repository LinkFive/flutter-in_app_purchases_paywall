import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'paywall_localizations_de.dart';
import 'paywall_localizations_en.dart';
import 'paywall_localizations_es.dart';

/// Callers can lookup localized strings with an instance of PaywallLocalizations
/// returned by `PaywallLocalizations.of(context)`.
///
/// Applications need to include `PaywallLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/paywall_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: PaywallLocalizations.localizationsDelegates,
///   supportedLocales: PaywallLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the PaywallLocalizations.supportedLocales
/// property.
abstract class PaywallLocalizations {
  PaywallLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static PaywallLocalizations? of(BuildContext context) {
    return Localizations.of<PaywallLocalizations>(context, PaywallLocalizations);
  }

  static const LocalizationsDelegate<PaywallLocalizations> delegate = _PaywallLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get monthly;

  /// No description provided for @quarterly.
  ///
  /// In en, this message translates to:
  /// **'quarterly'**
  String get quarterly;

  /// No description provided for @biannual.
  ///
  /// In en, this message translates to:
  /// **'biannual'**
  String get biannual;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'yearly'**
  String get yearly;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @nyear.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{1 year} other{{count} years}}'**
  String nyear(num count);

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @nmonth.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{1 month} other{{count} months}}'**
  String nmonth(num count);

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get week;

  /// No description provided for @nweek.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{1 week} other{{count} weeks}}'**
  String nweek(num count);

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @nday.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{1 day} other{{count} days}}'**
  String nday(num count);

  /// A button to select a premium subscription
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continue_button;

  /// A banner usually to show which subscription is most popular
  ///
  /// In en, this message translates to:
  /// **'Most popular'**
  String get most_popular;

  /// No description provided for @restore_purchase.
  ///
  /// In en, this message translates to:
  /// **'Restore purchase'**
  String get restore_purchase;

  /// No description provided for @manage_subscriptions_title.
  ///
  /// In en, this message translates to:
  /// **'Manage subscriptions'**
  String get manage_subscriptions_title;

  /// No description provided for @manage_subscription_google_play_title.
  ///
  /// In en, this message translates to:
  /// **'Manage your subscriptions on Google Play'**
  String get manage_subscription_google_play_title;

  /// No description provided for @manage_subscription_google_play_button.
  ///
  /// In en, this message translates to:
  /// **'Google Play Subscriptions'**
  String get manage_subscription_google_play_button;

  /// No description provided for @manage_subscription_productId.
  ///
  /// In en, this message translates to:
  /// **'{productId} verwalten'**
  String manage_subscription_productId(String productId);

  /// No description provided for @manage_subscription_apple_appstore_title.
  ///
  /// In en, this message translates to:
  /// **'Manage your subscriptions on the App Store'**
  String get manage_subscription_apple_appstore_title;

  /// No description provided for @manage_subscription_apple_appstore_button.
  ///
  /// In en, this message translates to:
  /// **'Go to the subscriptions page'**
  String get manage_subscription_apple_appstore_button;

  /// No description provided for @subscription_options_title.
  ///
  /// In en, this message translates to:
  /// **'Subscription options'**
  String get subscription_options_title;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @app_bar_default_title.
  ///
  /// In en, this message translates to:
  /// **'Go Premium'**
  String get app_bar_default_title;
}

class _PaywallLocalizationsDelegate extends LocalizationsDelegate<PaywallLocalizations> {
  const _PaywallLocalizationsDelegate();

  @override
  Future<PaywallLocalizations> load(Locale locale) {
    return SynchronousFuture<PaywallLocalizations>(lookupPaywallLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_PaywallLocalizationsDelegate old) => false;
}

PaywallLocalizations lookupPaywallLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return PaywallLocalizationsDe();
    case 'en': return PaywallLocalizationsEn();
    case 'es': return PaywallLocalizationsEs();
  }

  throw FlutterError(
    'PaywallLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
