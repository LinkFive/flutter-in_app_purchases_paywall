import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_restore_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/moritz/moritz_sub_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/legal_row.dart';
import 'package:responsive_spacing/responsive_spacing.dart';
import 'package:responsive_spacing/widgets/gutter.dart';

class MoritzPaywallPurchase extends StatelessWidget {
  const MoritzPaywallPurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaywallData paywallData = PaywallData.of(context);
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(

        ///
        /// Setting the color with the same logic as [AppBar.backgroundColor]
        ///
          color: theme.brightness == Brightness.dark
              ? theme.colorScheme.surface
              : theme.appBarTheme.backgroundColor ?? theme.colorScheme.primary),
      child: SingleChildScrollView(
          primary: false,
          child:
          ResponsiveCard(
            color: theme.cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            elevation: 0,
            child: Padding(
              padding:
              EdgeInsets.all(context.spacingConfig.padding.size),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.spacingConfig.padding.size),
                      child: Text(
                        paywallData.subTitle ?? "",
                        style: theme.textTheme.titleMedium,
                      )),
                  if (paywallData.campaignWidget != null)
                    paywallData.campaignWidget!,
                  const MoritzSubRow(),
                  const GutterColumn(),
                  const MoritzBulletPoints(),
                  const MoritzRestoreRow(),
                  const GutterColumn(),
                  const LegalRow()
                ],
              ),
            ),
          )
      ),
    );
  }
}
