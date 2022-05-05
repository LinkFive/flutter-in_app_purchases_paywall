import 'package:flutter/material.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
class SimplePaywallSuccess extends StatelessWidget {
  final Widget? headerContainer;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;

  SimplePaywallSuccess(
      {this.headerContainer,
      this.successTitle,
      this.successSubTitle,
      this.successWidget});

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    elements.add(
      Padding(
        padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
        child: Icon(
          Icons.check_circle,
          size: 48,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );

    if (successTitle != null) {
      elements.add(
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
            child: Text(
              successTitle!,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      );
    }
    if (successSubTitle != null) {
      elements.add(
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: Text(
              successSubTitle!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      );
    }
    if (successWidget != null) {
      elements.add(successWidget!);
    }

    return ListView(
      children: elements,
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
