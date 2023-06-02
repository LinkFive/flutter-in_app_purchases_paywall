import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';
import 'package:responsive_spacing/responsive_spacing.dart';
import 'package:responsive_spacing/widgets/gutter.dart';

/// Simple bullet point widget
class MoritzBulletPoints extends StatelessWidget {
  const MoritzBulletPoints();

  @override
  Widget build(BuildContext context) {
    PaywallData paywallData = PaywallData.of(context);
    ThemeData theme = Theme.of(context);
    return Column(
      children: paywallData.bulletPoints
              ?.map((bulletPoint) => Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: theme.colorScheme.primary),
                        height: context.spacing.s,
                        width: context.spacing.s,
                      ),
                      const GutterRow(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.spacingConfig.padding.size, vertical: 8),
                        child: Text(
                          bulletPoint.text,
                          maxLines: 2,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ))
              .toList(growable: false) ??
          [],
    );
  }
}
