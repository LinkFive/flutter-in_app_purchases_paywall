import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/delegate/paywall_localizations.dart';
import 'package:in_app_purchases_intl/delegate/paywall_localizations_en.dart';

/// Helper class to avoid annoying nullsafety call
abstract class PaywallL10NHelper {
  /// PaywallLocalization with fallback to EN
  static PaywallLocalizations of(BuildContext context) {
    return Localizations.of<PaywallLocalizations>(
            context, PaywallLocalizations) ??
        PaywallLocalizationsEn();
  }
}
