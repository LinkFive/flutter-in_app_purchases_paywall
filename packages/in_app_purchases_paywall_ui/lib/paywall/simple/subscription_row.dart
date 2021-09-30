import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_price_box.dart';

/// Simple Subscription Row.
class SubscriptionRow extends StatelessWidget {
  final List<SubscriptionData> subscriptionListData;
  final ThemeData theme;
  final bool isSubscriptionLoading;

  bool _shouldBreakText = false;
  double _padding = 16;
  int _boxMarginX = 4;
  bool _expandItems = true;

  SubscriptionRow(
      {required this.subscriptionListData,
      required this.isSubscriptionLoading,
      required this.theme}) {
    if (subscriptionListData.length == 1) {
      _expandItems = false;
    }
    if (subscriptionListData.length >= 3) {
      _shouldBreakText = true;
      _boxMarginX = 1;
    }
    if (subscriptionListData.length >= 4) {
      _padding = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> subscriptionList = subscriptionListData
        .map((subscriptionData) => SubscriptionPriceBox(
            subscriptionData, theme, _shouldBreakText,
            mx: _boxMarginX, expandItems: _expandItems))
        .toList(growable: false);
    if (isSubscriptionLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container(child: CircularProgressIndicator())],
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: _padding, right: _padding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: subscriptionList),
    );
  }
}
