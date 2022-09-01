import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_intl/model/duration_strings.dart';

/// Extension to get all strings for a specific duration
extension DurationExtension on String {
  /// Saves the translations of a subscription length to a model
  DurationStrings toDurationStrings(BuildContext context) {
    final paywallIntl = PaywallL10NHelper.of(context);
    // Switch the cases we know
    switch (this.toUpperCase()) {
      case "P1W":
        return DurationStrings(
            durationText: paywallIntl.weekly,
            durationTextNumber: paywallIntl.nweek(1),
            durationType: paywallIntl.week,
            durationNumber: 1);
      case "P4W":
        return DurationStrings(
            durationText: paywallIntl.weekly,
            durationTextNumber: paywallIntl.nweek(4),
            durationType: paywallIntl.week,
            durationNumber: 4);
      case "P1M":
        return DurationStrings(
            durationText: paywallIntl.monthly,
            durationTextNumber: paywallIntl.nmonth(1),
            durationType: paywallIntl.month,
            durationNumber: 1);
      case "P3M":
        return DurationStrings(
            durationText: paywallIntl.quarterly,
            durationTextNumber: paywallIntl.nmonth(3),
            durationType: paywallIntl.month,
            durationNumber: 3);
      case "P6M":
        return DurationStrings(
            durationText: paywallIntl.biannual,
            durationTextNumber: paywallIntl.nmonth(6),
            durationType: paywallIntl.month,
            durationNumber: 6);
      case "P1Y":
        return DurationStrings(
            durationText: paywallIntl.yearly,
            durationTextNumber: paywallIntl.nyear(1),
            durationType: paywallIntl.year,
            durationNumber: 1);
    }
    // fallback to a zero object
    return DurationStrings.zero(paywallIntl);
  }
}
