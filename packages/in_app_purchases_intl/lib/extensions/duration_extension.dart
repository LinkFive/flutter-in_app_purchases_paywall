import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/delegate/paywall_localizations.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_intl/model/duration_strings.dart';

/// Extension to get all strings for a specific duration
extension DurationExtension on String {
  @Deprecated("please use [fromIso8601]")
  DurationStrings toDurationStrings(BuildContext context) => fromIso8601(PaywallL10NHelper.of(context));

  /// ISO Codes such as P1W, P3W, P2Y etc.
  ///
  /// You can get the PaywallLocalizations with `PaywallL10NHelper.of(context)`
  DurationStrings fromIso8601(PaywallLocalizations paywallIntl) {
    final regex = RegExp(r'(\d+)([A-Z])');
    final match = regex.firstMatch(this);
    final amount = int.parse(match!.group(1)!);
    final unitString = match.group(2);

    if (unitString == null) {
      throw ArgumentError("String does not have a format of P1D, P1W, P1M, P1Y ");
    }
    return switch (unitString) {
      "D" => DurationStrings(
          durationText: paywallIntl.day,
          durationTextNumber: paywallIntl.nday(amount),
          durationType: paywallIntl.day,
          durationNumber: amount),
      "W" => DurationStrings(
          durationText: paywallIntl.weekly,
          durationTextNumber: paywallIntl.nweek(amount),
          durationType: paywallIntl.week,
          durationNumber: amount),
      "M" => switch (amount) {
          3 => DurationStrings(
              durationText: paywallIntl.quarterly,
              durationTextNumber: paywallIntl.nmonth(amount),
              durationType: paywallIntl.month,
              durationNumber: amount),
          6 => DurationStrings(
              durationText: paywallIntl.biannual,
              durationTextNumber: paywallIntl.nmonth(6),
              durationType: paywallIntl.month,
              durationNumber: 6),
          _ => DurationStrings(
              durationText: paywallIntl.monthly,
              durationTextNumber: paywallIntl.nmonth(amount),
              durationType: paywallIntl.month,
              durationNumber: amount)
        },
      "Y" => DurationStrings(
          durationText: paywallIntl.yearly,
          durationTextNumber: paywallIntl.nyear(amount),
          durationType: paywallIntl.year,
          durationNumber: amount),
      _ => throw ArgumentError()
    };
  }
}
