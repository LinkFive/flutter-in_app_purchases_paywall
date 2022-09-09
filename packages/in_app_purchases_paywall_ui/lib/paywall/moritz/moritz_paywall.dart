import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:in_app_purchases_paywall_ui/paywall/base/base_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
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
    String? title,
    String? subTitle,
    String? continueText,
    TextAndUrl? tosData,
    TextAndUrl? ppData,
    Widget? headerContainer,
    List<IconAndText>? bulletPoints,
    Widget? campaignWidget,
    String? restoreText,
    String? successTitle,
    String? successSubTitle,
    Widget? successWidget,
    bool isSubscriptionLoading = false,
    bool isPurchaseInProgress = false,
    PurchaseState? purchaseState = null,
    List<SubscriptionData>? subscriptionListData,
    CallbackInterface? callbackInterface,
    PurchaseStateStreamInterface? purchaseStateStreamInterface,
    List<ActivePlan>? activePlanList = null,
  }) : super(
            title: title,
            subTitle: subTitle,
            continueText: continueText,
            tosData: tosData,
            ppData: ppData,
            headerContainer: headerContainer,
            bulletPoints: bulletPoints,
            campaignWidget: campaignWidget,
            restoreText: restoreText,
            successTitle: successTitle,
            successSubTitle: successSubTitle,
            successWidget: successWidget,
            isSubscriptionLoading: isSubscriptionLoading,
            isPurchaseInProgress: isPurchaseInProgress,
            purchaseState: purchaseState ?? PurchaseState.NOT_PURCHASED,
            subscriptionListData: subscriptionListData,
            callbackInterface: callbackInterface,
            purchaseStateStreamInterface: purchaseStateStreamInterface,
            activePlanList: activePlanList);

  @override
  State createState() => _MoritzPaywallState();
}

/// State to control the State Streams
class _MoritzPaywallState extends BasePaywallState<MoritzPaywall> {
  @override
  Widget buildPaywall(BuildContext context, ThemeData theme) {
    return MoritzPaywallPurchase();
  }

  @override
  Widget buildSuccess(BuildContext context, ThemeData theme) {
    return SimplePaywallSuccess();
  }
}
