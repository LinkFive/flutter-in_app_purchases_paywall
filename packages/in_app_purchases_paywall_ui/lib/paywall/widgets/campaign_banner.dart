import 'package:flutter/material.dart';
import 'package:responsive_spacing/responsive_spacing.dart';

/// Basic Banner with a theme, headline, subTitle and a subContent Widget
class CampaignBanner extends StatelessWidget {
  final String headline;
  final String? subTitle;
  final Widget? subContent;

  const CampaignBanner(
      {required this.headline, this.subTitle, this.subContent});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(context.spacingConfig.padding.size),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              headline,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            // sub Title
            if (subTitle != null)
              Text(subTitle!,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center),
            // Sub Content
            if (subContent != null) subContent!
          ],
        ));
  }
}
