import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/delegate/paywall_localizations.dart';

/// Helper class to avoid annoying nullsafety call
abstract class PaywallL10NHelper {
  static PaywallLocalizations of(BuildContext context) {
    return Localizations.of<PaywallLocalizations>(
        context, PaywallLocalizations)!;
  }
}
