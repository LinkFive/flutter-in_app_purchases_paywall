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
  String nyear(int count) {
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
  String nmonth(int count) {
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
  String nweek(int count) {
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
  String nday(int count) {
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
}
