import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:responsive_spacing/responsive_spacing.dart';

/// Simple bullet point widget
class SimpleBulletPoints extends StatelessWidget {
  /// Bullet points
  final List<IconAndText> bulletPoints;

  const SimpleBulletPoints(this.bulletPoints);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bulletPoints
          .map<Widget>((bulletPoint) => Row(
            children: [
              Icon(
                bulletPoint.icon,
                size: context.spacing.iconSize,
                color: Theme.of(context).iconTheme.color,
              ),
              Padding(
                child: Text(
                  bulletPoint.text,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                padding: EdgeInsets.all(context.spacing.l),
              ),
            ],
          ))
          .toList(growable: false),
    );
  }
}
