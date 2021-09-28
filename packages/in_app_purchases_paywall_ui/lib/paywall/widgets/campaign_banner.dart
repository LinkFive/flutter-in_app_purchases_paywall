import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Basic Banner with a theme, headline, subTitle and a subContent Widget
class CampaignBanner extends StatelessWidget {
  final ThemeData theme;
  final String headline;
  final String? subTitle;
  final Widget? subContent;

  CampaignBanner(
      {required this.theme,
      required this.headline,
      this.subTitle = null,
      this.subContent = null});

  Widget get _subTitleWidget {
    if (subTitle != null) {
      return Text(subTitle!,
          style: theme.textTheme.subtitle1, textAlign: TextAlign.center);
    }
    return Container();
  }

  Widget get _subContentWidget {
    if (subContent != null) {
      return subContent!;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: BoxDecoration(
            color: theme.primaryColorLight,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              headline,
              style: theme.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            _subTitleWidget,
            _subContentWidget
          ],
        ));
  }
}
