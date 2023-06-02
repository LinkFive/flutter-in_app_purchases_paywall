import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';

/// Inherited Widget to pass subscriptions and callbackInterface
class PaywallDataIW extends InheritedWidget {
  /// Stored for all elements
  final PaywallData paywallData;

  PaywallDataIW({required super.child, required this.paywallData});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
