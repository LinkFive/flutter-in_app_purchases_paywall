import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/interface/purchase_state_stream_interface.dart';
import 'package:in_app_purchases_interface/model/purchase_state.dart';
import 'package:in_app_purchases_paywall_ui/paywall/base/base_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';

/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
class SimplePaywall extends BasePaywall {

  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal)
  SimplePaywall(
      {ThemeData? theme,
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
        PurchaseStateStreamInterface? purchaseStateStreamInterface})
      : super(
      theme: theme,
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
      purchaseStateStreamInterface: purchaseStateStreamInterface);

  @override
  State createState() => _SimplePaywallState();
}

/// State to control the State Streams
class _SimplePaywallState extends BasePaywallState<SimplePaywall> {

  @override
  Widget buildPaywall(BuildContext context, ThemeData theme) {
    return SimplePaywallPurchase(
        theme: theme,
        title: widget.title,
        subTitle: widget.subTitle,
        tosData: widget.tosData,
        ppData: widget.ppData,
        headerContainer: widget.headerContainer,
        bulletPoints: widget.bulletPoints,
        campaignWidget: widget.campaignWidget,
        restoreText: widget.restoreText,
        callbackInterface: widget.callbackInterface,
        isSubscriptionLoading: widget.isSubscriptionLoading);
  }

  @override
  Widget buildSuccess(BuildContext context, ThemeData theme) {
    return SimplePaywallSuccess(
      theme: theme,
      headerContainer: widget.headerContainer,
      successTitle: widget.successTitle,
      successSubTitle: widget.successSubTitle,
      successWidget: widget.successWidget,
    );
  }
}
