import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';

/// Simple Legal Row with TOS and PP
class LegalRow extends StatelessWidget {
  const LegalRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tosData = PaywallDataIW.of(context).tosData;
    final ppData = PaywallDataIW.of(context).ppData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (tosData != null)
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: GestureDetector(
              onTap: () async {
                final ChromeSafariBrowser browser = new ChromeSafariBrowser();
                await browser.open(
                    url: Uri.parse(PaywallDataIW.of(context).tosData!.url),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
              child: Text(
                tosData.name,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).textTheme.button?.color ??
                        Theme.of(context).primaryColor,
                    fontSize: 12),
              ),
            ),
          ),
        if (ppData != null)
          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: GestureDetector(
              onTap: () async {
                final ChromeSafariBrowser browser = new ChromeSafariBrowser();
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
                    color: Theme.of(context).textTheme.button?.color ??
                        Theme.of(context).primaryColor,
                    fontSize: 12),
              ),
            ),
          )
      ],
    );
  }
}
