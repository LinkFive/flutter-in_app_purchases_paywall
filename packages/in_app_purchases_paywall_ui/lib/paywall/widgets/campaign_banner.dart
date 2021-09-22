import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampaignBanner extends StatelessWidget {
  final ThemeData theme;
  final String headline;
  final String? subTitle;

  CampaignBanner({required this.theme, required this.headline, this.subTitle = null});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: BoxDecoration(color: theme.primaryColorLight, borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              headline,
              style: theme.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            subTitle != null
                ? Text(
                    subTitle!,
                    style: theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
                  )
                : Container()
          ],
        ));
  }
}
