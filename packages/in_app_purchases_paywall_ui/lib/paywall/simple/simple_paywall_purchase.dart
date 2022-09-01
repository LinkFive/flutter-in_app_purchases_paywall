import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
///ignore: must_be_immutable
class SimplePaywallPurchase extends StatelessWidget {
  bool isSubscriptionLoading = false;

  SimplePaywallPurchase({
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
          PaywallDataIW.of(context).title ??
              PaywallL10NHelper.of(context).app_bar_default_title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );

    // add SubTitle
    if (PaywallDataIW.of(context).subTitle != null) {
      elements.add(Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Text(PaywallDataIW.of(context).subTitle!,
              style: Theme.of(context).textTheme.bodyText2)));
    }

    elements.add(Container(
      padding: EdgeInsets.all(4),
    ));

    if (PaywallDataIW.of(context).bulletPoints != null) {
      elements.add(SimpleBulletPoints(PaywallDataIW.of(context).bulletPoints!));
    }

    if (PaywallDataIW.of(context).campaignWidget != null) {
      elements.add(PaywallDataIW.of(context).campaignWidget!);
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
            PaywallDataIW.of(context).restoreText ??
                PaywallL10NHelper.of(context).restore_purchase,
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
    elements.add(const LegalRow());

    elements.add(Container(
      padding: EdgeInsets.all(16),
    ));
    return elements;
  }
}
