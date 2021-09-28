import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/basic_statelesswidget.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
class SimplePayWall extends BasicStatelessWidget {
  final ThemeData theme;
  final String? title;
  final String? subTitle;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final Widget? headerContainer;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;
  bool isSubscriptionLoading = false;
  bool isPurchaseInProgress = false;
  bool isPurchaseSuccess = false;

  SimplePayWall(
      {required this.theme,
      this.title,
      this.subTitle,
      this.tosData,
      this.ppData,
      this.headerContainer,
      this.bulletPoints,
      this.campaignWidget,
      this.restoreText,
      this.successTitle,
      this.successSubTitle,
      this.successWidget,
      this.isSubscriptionLoading = false,
      this.isPurchaseInProgress = false,
      this.isPurchaseSuccess = false,
      CallbackInterface? callbackInterface,
      List<SubscriptionData>? subscriptionListData})
      : super(
            callbackInterface: callbackInterface,
            subscriptionListData: subscriptionListData);

  /// returns either the Purchase Widget or the Success Widget
  Widget get _getPurchaseOrSuccess {
    if (isPurchaseSuccess) {
      return SimplePayWallSuccess(
        theme: theme,
        headerContainer: headerContainer,
        successTitle: successTitle,
        successSubTitle: successSubTitle,
        successWidget: successWidget,
      );
    }
    return SimplePayWallPurchase(
        theme: theme,
        title: title,
        subTitle: subTitle,
        tosData: tosData,
        ppData: ppData,
        headerContainer: headerContainer,
        bulletPoints: bulletPoints,
        campaignWidget: campaignWidget,
        restoreText: restoreText,
        callbackInterface: callbackInterface,
        isSubscriptionLoading: isSubscriptionLoading,
        isPurchaseInProgress: isPurchaseInProgress,
        subscriptionListData: subscriptionListData);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackItems = [];
    stackItems.add(GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.red,
        child: ListView(children: <Widget>[
          headerContainer ?? Container(),
          _getPurchaseOrSuccess
        ])));
    if (isPurchaseInProgress) {
      stackItems.add(Scaffold(
        body: Center(child: CircularProgressIndicator()),
        backgroundColor: Color(0x22000000),
      ));
    }
    return Stack(children: stackItems);
  }
}
