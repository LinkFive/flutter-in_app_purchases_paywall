import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/subscription_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_price_box.dart';

class SubscriptionRow extends StatelessWidget {
  final List<SubscriptionData> subscriptionListData;
  final ThemeData theme;
  bool shouldBreakText = false;
  double padding = 16;
  int boxMarginX = 4;

  SubscriptionRow(this.subscriptionListData, this.theme){
    if(subscriptionListData.length >= 3){
      shouldBreakText = true;
      boxMarginX = 1;
    }
    if(subscriptionListData.length >= 4){
      padding = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> subscriptionList = subscriptionListData
        .map((subscriptionData) => SubscriptionPriceBox(subscriptionData, theme, shouldBreakText, mx: boxMarginX,))
        .toList(growable: false);

    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: subscriptionList),
    );
  }
}
