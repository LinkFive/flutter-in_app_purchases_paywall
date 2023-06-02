import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';
import 'package:responsive_spacing/widgets/gutter.dart';
import 'package:responsive_spacing/widgets/page_divider.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
///ignore: must_be_immutable
class SimplePaywallPurchase extends StatelessWidget {
  final bool isSubscriptionLoading;

  const SimplePaywallPurchase({
    super.key,
    this.isSubscriptionLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final paywallData = PaywallData.of(context);

    final inheritedWidget = SubscriptionCallbackIW.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GutterColumn(),
        PageDivider2(
            first: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const GutterColumn(),
              Text(
                paywallData.title ?? PaywallL10NHelper.of(context).app_bar_default_title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              // add SubTitle
              if (paywallData.subTitle != null) Text(paywallData.subTitle!, style: Theme.of(context).textTheme.bodyMedium),

              const GutterColumn(),

              if (paywallData.bulletPoints != null) SimpleBulletPoints(paywallData.bulletPoints!),
            ]),
            second: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const GutterColumn(),
                if (paywallData.campaignWidget != null) paywallData.campaignWidget!,
                const GutterColumn(),
                if (inheritedWidget.subscriptionListData != null)
                  SubscriptionRow(
                      subscriptionListData: inheritedWidget.subscriptionListData!,
                      isSubscriptionLoading: isSubscriptionLoading),
                const GutterColumn(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        paywallData.restoreText ?? PaywallL10NHelper.of(context).restore_purchase,
                      ),
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {
                        SubscriptionCallbackIW.of(context)?.onRestoreTap();
                      },
                    ),
                  ],
                ),
                const GutterColumn(),
                const LegalRow(),
                const GutterColumn(),
              ],
            )),
      ],
    );
  }
}
