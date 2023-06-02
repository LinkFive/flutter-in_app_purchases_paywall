import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';

/// Simple Legal Row with TOS and PP
class LegalRow extends StatelessWidget {
  const LegalRow({super.key});

  @override
  Widget build(BuildContext context) {
    final tosData = PaywallData.of(context).tosData;
    final ppData = PaywallData.of(context).ppData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (tosData != null)
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: GestureDetector(
              onTap: () async {
                final ChromeSafariBrowser browser = ChromeSafariBrowser();
                await browser.open(
                    url: Uri.parse(PaywallData.of(context).tosData!.url),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
              child: Text(
                tosData.name,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).textTheme.labelLarge?.color ??
                        Theme.of(context).primaryColor,
                    fontStyle: Theme.of(context).textTheme.bodySmall!.fontStyle),
              ),
            ),
          ),
        if (ppData != null)
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: GestureDetector(
              onTap: () async {
                final ChromeSafariBrowser browser = ChromeSafariBrowser();
                await browser.open(
                    url: Uri.parse(ppData.url),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
              child: Text(
                ppData.name,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).textTheme.labelLarge?.color ??
                        Theme.of(context).primaryColor,
                    fontStyle: Theme.of(context).textTheme.bodySmall!.fontStyle),
              ),
            ),
          )
      ],
    );
  }
}
