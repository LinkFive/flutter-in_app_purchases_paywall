import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/basic_statelesswidget.dart';

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
  bool isSubscriptionLoading = false;
  bool isPurchaseInProgress = false;

  SimplePayWall({required this.theme,
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
      : super(callbackInterface: callbackInterface,
      subscriptionListData: subscriptionListData);

  @override
  Widget build(BuildContext context) {
    List<Widget> stackItems = [];
    stackItems.add(GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.red,
        child: ListView(children: <Widget>[
          headerContainer ?? Container(),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
            child: Text(
              title ?? "Go Premium",
              style: theme.textTheme.headline5,
            ),
          ),
          ..._premiumContent,
          Container(
            padding: EdgeInsets.all(8),
          ),
          _LegalRow(theme, tosData, ppData)
        ])));
    if (isPurchaseInProgress) {
      stackItems.add(Scaffold(body: Center(child: CircularProgressIndicator()), backgroundColor: Color(0x22000000),));
    }
    return Stack(children: stackItems);
  }

  List<Widget> get _premiumContent {
    List<Widget> elements = [];

    // add SubTitle
    if (subTitle != null) {
      elements.add(Container(
          margin: EdgeInsets.only(left: 16, right: 16), child: Text(subTitle!, style: theme.textTheme.bodyText2)));
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    elements.addAll(bulletPoints
        ?.map<Widget>((bulletPoint) =>
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Icon(
                bulletPoint.icon,
                size: 24,
                color: theme.iconTheme.color,
              ),
              Padding(
                child: Text(
                  bulletPoint.text,
                  maxLines: 2,
                  style: theme.textTheme.bodyText1,
                ),
                padding: EdgeInsets.all(16),
              ),
            ],
          ),
        ))
        .toList(growable: false) ??
        []);

    if (campaignWidget != null) {
      elements.add(campaignWidget!);
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    if (subscriptionListData != null) {
      elements.add(SubscriptionRow(subscriptionListData!, onPurchase, isSubscriptionLoading, theme));
    }
    if (onRestoreTap != null) {
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
    }
    return elements;
  }
}

class _LegalRow extends StatelessWidget {
  final ChromeSafariBrowser browser = new ChromeSafariBrowser();
  final ThemeData theme;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;

  _LegalRow(this.theme, this.tosData, this.ppData);

  _onTapTos() async {
    await browser.open(
        url: Uri.parse(tosData!.url),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  _onTapPp() async {
    await browser.open(
        url: Uri.parse(ppData!.url),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  Widget get tosItem =>
      tosData == null
          ? Container()
          : GestureDetector(
        onTap: _onTapTos,
        child: Text(
          tosData?.name ?? "Terms of Service",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: theme.textTheme.button?.color ?? theme.primaryColor,
              fontSize: 12),
        ),
      );

  Widget get ppItem =>
      ppData == null
          ? Container()
          : GestureDetector(
        onTap: _onTapPp,
        child: Text(
          ppData?.name ?? "Privacy Policy",
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: theme.textTheme.button?.color ?? theme.primaryColor,
              fontSize: 12),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: tosItem,
        ),
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: ppItem,
        )
      ],
    );
  }
}
