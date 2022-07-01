import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';

class MoritzRestoreRow extends StatelessWidget {
  final String? restoreText;

  MoritzRestoreRow({this.restoreText = "Restore"});

  @override
  Widget build(BuildContext context) {
    SubscriptionCallbackIW subscriptionData =
        SubscriptionCallbackIW.of(context)!;
    return TextButton(
        onPressed: () {
          subscriptionData.onRestoreTap();
        },
        child: Text(restoreText!, style: Theme.of(context).textTheme.button));
  }
}
