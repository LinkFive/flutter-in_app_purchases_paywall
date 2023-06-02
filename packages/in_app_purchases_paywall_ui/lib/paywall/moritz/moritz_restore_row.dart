import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';

class MoritzRestoreRow extends StatelessWidget {
  const MoritzRestoreRow();

  @override
  Widget build(BuildContext context) {
    SubscriptionCallbackIW subscriptionData =
        SubscriptionCallbackIW.of(context)!;
    return TextButton(
        onPressed: () {
          subscriptionData.onRestoreTap();
        },
        child: Text(
            PaywallData.of(context).restoreText ??
                PaywallL10NHelper.of(context).restore_purchase,
            style: Theme.of(context).textTheme.labelLarge));
  }
}
