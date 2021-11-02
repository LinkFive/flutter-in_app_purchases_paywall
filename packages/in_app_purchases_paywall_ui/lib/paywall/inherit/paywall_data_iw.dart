import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

/// Inherited Widget to pass subscriptions and callbackInterface
class PaywallDataIW extends InheritedWidget {
  /// All subscription Data
  final ThemeData? theme;
  final String? title;
  final String? subTitle;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;

  PaywallDataIW({
    required Widget child,
    this.theme,
    this.title,
    this.subTitle,
    this.tosData,
    this.ppData,
    this.bulletPoints,
    this.campaignWidget,
    this.restoreText,
    this.successTitle,
    this.successSubTitle,
    this.successWidget,
  }) : super(child: child);

  PaywallDataIW.empty() : this(child: Text("No Widget found"));

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static PaywallDataIW of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PaywallDataIW>() ??
        PaywallDataIW.empty();
  }
}
