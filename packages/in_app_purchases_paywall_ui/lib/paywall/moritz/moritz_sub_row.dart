import 'dart:math';

import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_price_box.dart';

class MoritzSubRow extends StatefulWidget {
  const MoritzSubRow({super.key});

  @override
  State<StatefulWidget> createState() => _MoritzSubRowState();

}

class _MoritzSubRowState extends State<MoritzSubRow> {
  int _selectedIndex = -1;

  onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SubscriptionCallbackIW subscriptionData =
        SubscriptionCallbackIW.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        int size = subscriptionData.subscriptionListData?.length ?? 0;
        double width = constraints.maxWidth / size;

        PaywallData paywallData = PaywallData.of(context);

        return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: subscriptionData.subscriptionListData
                        ?.map((e) => MoritzPriceBox(
                            e, width, e.index == _selectedIndex, onSelectIndex))
                        .toList() ??
                    []),
            Container(
              height: 8,
            ),
            SizedBox(
                width: min(constraints.maxWidth, 340),
                child: ElevatedButton(
                    onPressed: _selectedIndex >= 0
                        ? () {
                            var selected = subscriptionData.subscriptionListData
                                ?.firstWhere((element) =>
                                    element.index == _selectedIndex);
                            if (selected != null) {
                              subscriptionData.onPurchase(selected);
                            }
                          }
                        : null,
                    child: Text((paywallData.continueText ??
                            PaywallL10NHelper.of(context).continue_button)
                        .toUpperCase()),
                    style: Theme.of(context).elevatedButtonTheme.style))
          ],
        );
      },
    );
  }
}
