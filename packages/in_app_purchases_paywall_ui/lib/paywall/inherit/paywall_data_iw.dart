import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

/// Inherited Widget to pass subscriptions and callbackInterface
class PaywallDataIW extends InheritedWidget {
  /// All subscription Data
  final String? title;
  final String? subTitle;
  final String? continueText;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;
  final List<ActivePlan>? activePlanList;

  PaywallDataIW(
      {required Widget child,
      this.title,
      this.subTitle,
      this.continueText,
      this.tosData,
      this.ppData,
      this.bulletPoints,
      this.campaignWidget,
      this.restoreText,
      this.successTitle,
      this.successSubTitle,
      this.successWidget,
      this.activePlanList})
      : super(child: child);

  PaywallDataIW.empty() : this(child: Text("No Widget found"));

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static PaywallDataIW of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PaywallDataIW>() ??
        PaywallDataIW.empty();
  }
}
