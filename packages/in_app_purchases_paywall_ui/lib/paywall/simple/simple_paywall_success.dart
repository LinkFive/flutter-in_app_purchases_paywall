import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_bulletpoints.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/subscription_row.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/basic_statelesswidget.dart';

/// This Widget is without a scaffold. Use SimplePayWallScaffold if you want to have an appBar
class SimplePayWallSuccess extends BasicStatelessWidget {
  final ThemeData theme;
  final Widget? headerContainer;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;

  SimplePayWallSuccess(
      {required this.theme,
      this.headerContainer,
      this.successTitle,
      this.successSubTitle,
      this.successWidget});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _content,
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }

  List<Widget> get _content {
    List<Widget> elements = [];

    elements.add(
      Padding(
        padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
        child: Icon(
          Icons.check_circle,
          size: 48,
          color: theme.iconTheme.color,
        ),
      ),
    );

    if(successTitle != null){
      elements.add(
        Center(child:
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Text(
            successTitle!,
            style: theme.textTheme.headline5,
          ),
        ),
      ),);
    }
    if (successSubTitle != null) {
      elements.add(
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: Text(
              successSubTitle!,
              style: theme.textTheme.bodyText2,
            ),
          ),
        ),
      );
    }
    if(successWidget != null){
      elements.add(successWidget!);
    }

    return elements;
  }
}
