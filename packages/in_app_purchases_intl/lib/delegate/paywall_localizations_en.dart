

import 'package:intl/intl.dart' as intl;
import 'paywall_localizations.dart';

/// The translations for English (`en`).
class PaywallLocalizationsEn extends PaywallLocalizations {
  PaywallLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get weekly => 'weekly';

  @override
  String get monthly => 'monthly';

  @override
  String get quarterly => 'quarterly';

  @override
  String get biannual => 'biannual';

  @override
  String get yearly => 'yearly';

  @override
  String get year => 'year';

  @override
  String nyear(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 year',
      other: '$count years',
    );
  }

  @override
  String get month => 'month';

  @override
  String nmonth(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 month',
      other: '$count months',
    );
  }

  @override
  String get week => 'week';

  @override
  String nweek(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 week',
      other: '$count weeks',
    );
  }

  @override
  String get day => 'day';

  @override
  String nday(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 day',
      other: '$count days',
    );
  }

  @override
  String get continue_button => 'continue';

  @override
  String get most_popular => 'Most popular';

  @override
  String get restore_purchase => 'Restore purchase';

  @override
  String get manage_subscriptions_title => 'Manage subscriptions';

  @override
  String get manage_subscription_google_play_title => 'Manage your subscriptions on Google Play';

  @override
  String get manage_subscription_google_play_button => 'Google Play Subscriptions';

  @override
  String get subscription_options_title => 'Subscription options';

  @override
  String get premium => 'Premium';

  @override
  String get app_bar_default_title => 'Go Premium';
}
