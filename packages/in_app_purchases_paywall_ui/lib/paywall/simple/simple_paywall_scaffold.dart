import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall.dart';

/// Wrap the SimplePayWall into a scaffold including an AppBar
class SimplePayWallScaffold extends SimplePayWall {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String? appBarTitle;

  SimplePayWallScaffold(
      {required ThemeData theme,
      this.appBarTitle,
      String? title,
      String? subTitle,
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
      bool isPurchaseSuccess = false,
      CallbackInterface? callbackInterface = null,
      List<SubscriptionData>? subscriptionListData})
      : super(
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
            subscriptionListData: subscriptionListData);

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
        body: super.build(context));
  }
}
