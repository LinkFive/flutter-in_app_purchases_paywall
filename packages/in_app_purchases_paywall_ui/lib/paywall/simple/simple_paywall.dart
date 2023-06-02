// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/base/base_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';

///
/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
///
/// The Paywall Library is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
/// ignore: must_be_immutable
class SimplePaywall extends BasePaywall {
  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal)
  SimplePaywall({
    super.key,
    super.title,
    super.subTitle,
    super.continueText,
    super.tosData,
    super.ppData,
    super.headerContainer,
    super.bulletPoints,
    super.campaignWidget,
    super.restoreText,
    super.successTitle,
    super.successSubTitle,
    super.successWidget,
    super.isSubscriptionLoading,
    super.isPurchaseInProgress,
    super.purchaseState,
    super.subscriptionListData,
    super.callbackInterface,
    super.purchaseStateStreamInterface,
    super.activePlanList,
  });

  @override
  State createState() => _SimplePaywallState();
}

/// State to control the State Streams
class _SimplePaywallState extends BasePaywallState<SimplePaywall> {
  @override
  Widget buildPaywall(BuildContext context) {
    return SimplePaywallPurchase(
        isSubscriptionLoading: widget.isSubscriptionLoading);
  }

  @override
  Widget buildSuccess(BuildContext context) {
    return SimplePaywallSuccess();
  }
}
