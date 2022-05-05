import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
///ignore: must_be_immutable
class SimplePaywallPurchase extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final Widget? headerContainer;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  bool isSubscriptionLoading = false;

  SimplePaywallPurchase({
    this.title,
    this.subTitle,
    this.tosData,
    this.ppData,
    this.headerContainer,
    this.bulletPoints,
    this.campaignWidget,
    this.restoreText,
    this.isSubscriptionLoading = false,
    CallbackInterface? callbackInterface,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _premiumContent(context),
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }

  List<Widget> _premiumContent(BuildContext context) {
    List<Widget> elements = [];

    elements.add(
      Padding(
        padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
        child: Text(
          title ?? "Go Premium",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );

    // add SubTitle
    if (subTitle != null) {
      elements.add(Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child:
              Text(subTitle!, style: Theme.of(context).textTheme.bodyText2)));
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    if (bulletPoints != null) {
      elements.add(SimpleBulletPoints(bulletPoints!));
    }

    if (campaignWidget != null) {
      elements.add(campaignWidget!);
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));
    var inheritedWidget = SubscriptionCallbackIW.of(context)!;
    if (inheritedWidget.subscriptionListData != null) {
      elements.add(SubscriptionRow(
          subscriptionListData: inheritedWidget.subscriptionListData!,
          isSubscriptionLoading: isSubscriptionLoading));
    }
    elements.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text(
            restoreText ?? "Restore purchase",
          ),
          style: Theme.of(context).textButtonTheme.style,
          onPressed: () {
            SubscriptionCallbackIW.of(context)?.onRestoreTap();
          },
        ),
      ],
    ));

    elements.add(Container(
      padding: EdgeInsets.all(8),
    ));
    elements.add(LegalRow(Theme.of(context), tosData, ppData));

    elements.add(Container(
      padding: EdgeInsets.all(16),
    ));
    return elements;
  }
}
