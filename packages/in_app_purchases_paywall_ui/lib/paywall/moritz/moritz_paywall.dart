import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/base/base_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';

///
/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
///
/// Moritz Paywall was designed by Moritz.
///
/// The Paywall Library is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
/// ignore: must_be_immutable
class MoritzPaywall extends BasePaywall {
  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal)
  MoritzPaywall({
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
  State createState() => _MoritzPaywallState();
}

/// State to control the State Streams
class _MoritzPaywallState extends BasePaywallState<MoritzPaywall> {
  @override
  Widget buildPaywall(BuildContext context) {
    return const MoritzPaywallPurchase();
  }

  @override
  Widget buildSuccess(BuildContext context) {
    return const SimplePaywallSuccess();
  }
}
