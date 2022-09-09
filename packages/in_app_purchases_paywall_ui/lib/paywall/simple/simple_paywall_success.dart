import 'package:flutter/material.dart';
import 'package:in_app_purchases_intl/helper/paywall_helper.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/active_plan.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/active_plan_card.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/insets/page_insets.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
class SimplePaywallSuccess extends StatelessWidget {
  SimplePaywallSuccess();

  @override
  Widget build(BuildContext context) {
    final paywallData = PaywallDataIW.of(context);
    final successTitle = paywallData.successTitle;
    final successSubTitle = paywallData.successSubTitle;
    final successWidget = paywallData.successWidget;
    final List<ActivePlan>? activePlanList = paywallData.activePlanList;

    return ListView(
      children: [
        if (successTitle != null)
          Padding(
            padding: const PageInsets.normal(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  successTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
        if (successSubTitle != null)
          Padding(
            padding: const PageInsets.normal(),
            child: Center(
              child: Text(
                successSubTitle,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        if (successWidget != null) successWidget,
        if (activePlanList != null) ...[
          SizedBox(height: 24),
          Padding(
            padding: const PageInsets.normal(),
            child: Text(
              PaywallL10NHelper.of(context).manage_subscriptions_title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          for (var plan in activePlanList)
            Padding(
              padding: const PageInsets.normal(),
              child: ActivePlanCard(plan),
            )
        ]
      ],
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
