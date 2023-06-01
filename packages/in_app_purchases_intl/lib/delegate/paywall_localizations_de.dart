import 'package:intl/intl.dart' as intl;

import 'paywall_localizations.dart';

/// The translations for German (`de`).
class PaywallLocalizationsDe extends PaywallLocalizations {
  PaywallLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get weekly => 'wöchentlich';

  @override
  String get monthly => 'monatlich';

  @override
  String get quarterly => 'pro quartal';

  @override
  String get biannual => 'halbjährlich';

  @override
  String get yearly => 'jährlich';

  @override
  String get year => 'jahr';

  @override
  String nyear(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jahre',
      one: '1 jahr',
    );
    return '$_temp0';
  }

  @override
  String get month => 'monat';

  @override
  String nmonth(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count monate',
      one: '1 monat',
    );
    return '$_temp0';
  }

  @override
  String get week => 'woche';

  @override
  String nweek(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wochen',
      one: '1 woche',
    );
    return '$_temp0';
  }

  @override
  String get day => 'tag';

  @override
  String nday(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tage',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String get continue_button => 'weiter';

  @override
  String get most_popular => 'am beliebtesten';

  @override
  String get restore_purchase => 'Kauf wiederherstellen';

  @override
  String get manage_subscriptions_title => 'Abonnements verwalten';

  @override
  String get manage_subscription_google_play_title => 'Abonnements auf Google Play verwalten';

  @override
  String get manage_subscription_google_play_button => 'Google Play-Abonnements';

  @override
  String manage_subscription_productId(String productId) {
    return 'Manage $productId';
  }

  @override
  String get manage_subscription_apple_appstore_title => 'Abonnements im App Store verwalten';

  @override
  String get manage_subscription_apple_appstore_button => 'Zu den App Store Abonnements';

  @override
  String get subscription_options_title => 'Abonnement Optionen';

  @override
  String get premium => 'Premium';

  @override
  String get app_bar_default_title => 'Go Premium';
}
