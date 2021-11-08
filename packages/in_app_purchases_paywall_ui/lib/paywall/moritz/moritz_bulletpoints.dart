import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';

/// Simple bullet point widget
class MoritzBulletPoints extends StatelessWidget {
  MoritzBulletPoints();

  @override
  Widget build(BuildContext context) {
    PaywallDataIW paywallData = PaywallDataIW.of(context);
    ThemeData theme = paywallData.theme ?? Theme.of(context);
    return Column(
      children: paywallData.bulletPoints
              ?.map<Widget>((bulletPoint) => Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.primaryColor),
                          height: 8,
                          width: 8,
                        ),
                        Padding(
                          child: Text(
                            bulletPoint.text,
                            maxLines: 2,
                            style: theme.textTheme.bodyText1,
                          ),
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                        ),
                      ],
                    ),
                  ))
              .toList(growable: false) ??
          [],
    );
  }
}
