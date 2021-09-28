import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/basic_statelesswidget.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
class SimplePayWallPurchase extends BasicStatelessWidget {
  final ThemeData theme;
  final String? title;
  final String? subTitle;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final Widget? headerContainer;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  bool isSubscriptionLoading = false;
  bool isPurchaseInProgress = false;

  SimplePayWallPurchase(
      {required this.theme,
      this.title,
      this.subTitle,
      this.tosData,
      this.ppData,
      this.headerContainer,
      this.bulletPoints,
      this.campaignWidget,
      this.restoreText,
      this.isSubscriptionLoading = false,
      this.isPurchaseInProgress = false,
      CallbackInterface? callbackInterface,
      List<SubscriptionData>? subscriptionListData})
      : super(
            callbackInterface: callbackInterface,
            subscriptionListData: subscriptionListData);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _premiumContent,
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }

  List<Widget> get _premiumContent {
    List<Widget> elements = [];

    elements.add(
      Padding(
        padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
        child: Text(
          title ?? "Go Premium",
          style: theme.textTheme.headline5,
        ),
      ),
    );

    // add SubTitle
    if (subTitle != null) {
      elements.add(Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Text(subTitle!, style: theme.textTheme.bodyText2)));
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    if (bulletPoints != null) {
      elements.add(SimpleBulletPoints(theme, bulletPoints!));
    }

    if (campaignWidget != null) {
      elements.add(campaignWidget!);
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    if (subscriptionListData != null) {
      elements.add(SubscriptionRow(
          subscriptionListData!, onPurchase, isSubscriptionLoading, theme));
    }
    elements.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text(
            restoreText ?? "Restore purchase",
          ),
          style: theme.textButtonTheme.style,
          onPressed: () {
            onRestoreTap();
          },
        ),
      ],
    ));

    elements.add(Container(
      padding: EdgeInsets.all(8),
    ));
    elements.add(LegalRow(theme, tosData, ppData));

    elements.add(Container(
      padding: EdgeInsets.all(16),
    ));
    return elements;
  }
}
