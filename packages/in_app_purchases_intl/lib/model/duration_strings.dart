import 'package:in_app_purchases_intl/delegate/paywall_localizations.dart';

class DurationStrings {
  /// e.g. biannual
  final String durationText;

  /// e.g. 6 months
  final String durationTextNumber;

  /// e.g. month
  final String durationType;

  /// e.g. 6
  final int durationNumber;

  DurationStrings(
      {required this.durationText,
      required this.durationTextNumber,
      required this.durationType,
      required this.durationNumber});

  /// Empty fallback object
  DurationStrings.zero(PaywallLocalizations paywallIntl)
      : durationText = paywallIntl.day,
        durationNumber = 0,
        durationTextNumber = paywallIntl.day,
        durationType = paywallIntl.day;
}
