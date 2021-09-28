import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

/// Simple bullet point widget
class SimpleBulletPoints extends StatelessWidget {

  final ThemeData theme;
  /// Bullet points
  final List<IconAndText> bulletPoints;

  SimpleBulletPoints(this.theme, this.bulletPoints);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bulletPoints
          .map<Widget>((bulletPoint) => Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Icon(
                      bulletPoint.icon,
                      size: 24,
                      color: theme.iconTheme.color,
                    ),
                    Padding(
                      child: Text(
                        bulletPoint.text,
                        maxLines: 2,
                        style: theme.textTheme.bodyText1,
                      ),
                      padding: EdgeInsets.all(16),
                    ),
                  ],
                ),
              ))
          .toList(growable: false),
    );
  }
}
