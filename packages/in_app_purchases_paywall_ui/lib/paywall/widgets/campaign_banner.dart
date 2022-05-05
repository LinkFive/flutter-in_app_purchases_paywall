import 'package:flutter/material.dart';

/// Basic Banner with a theme, headline, subTitle and a subContent Widget
class CampaignBanner extends StatelessWidget {
  final String headline;
  final String? subTitle;
  final Widget? subContent;

  CampaignBanner(
      {required this.headline, this.subTitle = null, this.subContent = null});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              headline,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            // sub Title
            if (subTitle != null)
              Text(subTitle!,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center),
            // Sub Content
            if (subContent != null) subContent!
          ],
        ));
  }
}
