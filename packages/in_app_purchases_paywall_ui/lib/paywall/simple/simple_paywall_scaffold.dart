import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall.dart';

/// Wrap the SimplePayWall into a scaffold including an AppBar
class SimplePayWallScaffold extends StatelessWidget {
  final ThemeData theme;
  final String? appBarTitle;
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
  final bool isSubscriptionLoading;
  final bool isPurchaseInProgress;
  final bool isPurchaseSuccess;
  final List<SubscriptionData>? subscriptionListData;
  final CallbackInterface? callbackInterface;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  SimplePayWallScaffold(
      {required this.theme,
      this.appBarTitle,
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
      this.callbackInterface = null,
      this.subscriptionListData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: theme.appBarTheme.backgroundColor,
        appBar: AppBar(
          textTheme: theme.textTheme,
          actionsIconTheme: theme.accentIconTheme,
          brightness: theme.brightness,
          iconTheme: theme.iconTheme,
          backgroundColor: theme.backgroundColor,
          title: Text(appBarTitle ?? "Premium"),
          elevation: 0.0,
          actions: [],
        ),
        body: SimplePayWall(
            theme: theme,
            title: title,
            subTitle: subTitle,
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
            isPurchaseSuccess: isPurchaseSuccess,
            callbackInterface: callbackInterface,
            subscriptionListData: subscriptionListData));
  }
}
