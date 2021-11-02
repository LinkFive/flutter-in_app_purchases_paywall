import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_price_box.dart';

class MoritzSubRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaywallDataIW paywallData = PaywallDataIW.of(context);
    SubscriptionCallbackIW subscriptionData =
        SubscriptionCallbackIW.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        int size = subscriptionData.subscriptionListData?.length ?? 0;
        double width = constraints.maxWidth / size;

        PaywallDataIW paywallData = PaywallDataIW.of(context);
        ThemeData themeData = paywallData.theme ?? Theme.of(context);

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: subscriptionData.subscriptionListData
                    ?.map((e) => MoritzPriceBox(themeData, e, width))
                    .toList() ??
                []);
      },
    );
  }
}
