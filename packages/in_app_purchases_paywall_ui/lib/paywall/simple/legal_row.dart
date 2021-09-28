import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

/// Simple Legal Row with TOS and PP
class LegalRow extends StatelessWidget {
  final ChromeSafariBrowser browser = new ChromeSafariBrowser();
  final ThemeData theme;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;

  LegalRow(this.theme, this.tosData, this.ppData);

  /// Opens Browser onTap with the given URL
  _onTapTos() async {
    await browser.open(
        url: Uri.parse(tosData!.url),
        options: ChromeSafariBrowserClassOptions(
            android:
                AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  /// Opens Browser onTap with the given URL
  _onTapPp() async {
    await browser.open(
        url: Uri.parse(ppData!.url),
        options: ChromeSafariBrowserClassOptions(
            android:
                AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  Widget get tosItem => tosData == null
      ? Container()
      : GestureDetector(
          onTap: _onTapTos,
          child: Text(
            tosData?.name ?? "Terms of Service",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: theme.textTheme.button?.color ?? theme.primaryColor,
                fontSize: 12),
          ),
        );

  Widget get ppItem => ppData == null
      ? Container()
      : GestureDetector(
          onTap: _onTapPp,
          child: Text(
            ppData?.name ?? "Privacy Policy",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: theme.textTheme.button?.color ?? theme.primaryColor,
                fontSize: 12),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: tosItem,
        ),
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: ppItem,
        )
      ],
    );
  }
}
