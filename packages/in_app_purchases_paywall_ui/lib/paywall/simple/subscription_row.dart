import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_price_box.dart';
import 'package:responsive_spacing/widgets/gutter.dart';

/// Simple Subscription Row.
///ignore: must_be_immutable
class SubscriptionRow extends StatelessWidget {
  final List<SubscriptionData> subscriptionListData;
  final bool isSubscriptionLoading;

  bool _shouldBreakText = false;
  int _boxMarginX = 4;

  SubscriptionRow({required this.subscriptionListData, required this.isSubscriptionLoading, super.key}) {
    if (subscriptionListData.length >= 3) {
      _shouldBreakText = true;
      _boxMarginX = 1;
    }
    if (subscriptionListData.length >= 4) {}
  }

  @override
  Widget build(BuildContext context) {
    if (isSubscriptionLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container(child: const CircularProgressIndicator())],
      );
    }

    // we do some crazy magic here
    // it probably cant be done differently :)
    List<List<Widget>> widgetList = subscriptionListData
        .map((subscriptionData) =>
            [SubscriptionPriceBox(subscriptionData, _shouldBreakText, mx: _boxMarginX), GutterRow()])
        .toList(growable: true);

    // spread the list and remove last object
    if (subscriptionListData.length >= 4) {
      // if more than 3 elements, use rows to display the sub
      List<Widget> widgetRows = [];
      while (widgetList.isNotEmpty) {
        widgetRows.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [for (final listItem in widgetList.take(2)) ...listItem]..removeLast()));
        widgetRows.add(const GutterColumn());
        if (widgetList.length > 1) {
          widgetList.removeRange(0, 2);
        } else {
          widgetList.clear();
        }
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [...widgetRows..removeLast()],
      );
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [for (final listItem in widgetList) ...listItem]..removeLast());
  }
}
