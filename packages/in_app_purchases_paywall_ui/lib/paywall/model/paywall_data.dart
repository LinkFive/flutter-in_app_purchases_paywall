import 'package:flutter/widgets.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/active_plan.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';

import '../inherit/paywall_data_iw.dart';

class PaywallData {
  final String? title;
  final String? subTitle;
  final String? continueText;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;
  final List<ActivePlan>? activePlanList;

  PaywallData(
      {this.title,
      this.subTitle,
      this.continueText,
      this.tosData,
      this.ppData,
      this.bulletPoints,
      this.campaignWidget,
      this.restoreText,
      this.successTitle,
      this.successSubTitle,
      this.successWidget,
      this.activePlanList});


  static PaywallData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PaywallDataIW>()?.paywallData ??
        (throw StateError("No PaywallDataIW found"));
  }
}
