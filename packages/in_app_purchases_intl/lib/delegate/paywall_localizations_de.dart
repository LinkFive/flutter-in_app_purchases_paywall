

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
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 jahr',
      other: '$count jahre',
    );
  }

  @override
  String get month => 'monat';

  @override
  String nmonth(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 monat',
      other: '$count monate',
    );
  }

  @override
  String get week => 'woche';

  @override
  String nweek(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 woche',
      other: '$count wochen',
    );
  }

  @override
  String get day => 'tag';

  @override
  String nday(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 tag',
      other: '$count tage',
    );
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
  String get subscription_options_title => 'Abonnement Optionen';

  @override
  String get premium => 'Premium';

  @override
  String get app_bar_default_title => 'Go Premium';
}
