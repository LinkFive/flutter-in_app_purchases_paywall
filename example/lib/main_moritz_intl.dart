import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_purchases_intl/in_app_purchases_intl.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // custom icon theme
        iconTheme: IconThemeData(color: Colors.lightGreen),

        // color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
        )
      ),
      supportedLocales: [
        const Locale('en'),
        const Locale('de'),
      ],
      localizationsDelegates: [
        PaywallLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PurchaseHandler purchaseHandler = PurchaseHandler();

  @override
  Widget build(BuildContext context) {
    final translations = PaywallL10NHelper.of(context);
    return PaywallScaffold(
      // appBarTitle for scaffold
      appBarTitle: "YourApp Premium",
      child: MoritzPaywall(
          // Title Bar
          title: "Go Premium",
          // SubTitle
          subTitle:
              "Enjoy all the advantages of YourApp with the Premium subscription.",
          continueText: "Continue",
          // Add as many bullet points as you like
          bulletPoints: [
            IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
            IconAndText(Icons.hd, "Premium HD"),
            IconAndText(Icons.sort, "Access to All Premium Articles")
          ],
          // Your subscriptions that you want to offer to the user
          subscriptionListData: [
            SubscriptionData(
                durationTitle: translations.yearly.toTitleCase(),
                durationShort: translations.nmonth(12),
                price: "€14,99€",
                highlightText: "Most popular",
                dealPercentage: 59,
                productDetails: "Dynamic purchase data",
                currencySymbol: "€",
                rawPrice: 14.99,
                monthText: translations.month,
                duration: "P1Y",
                index: 3),
            SubscriptionData(
                durationTitle: translations.monthly.toTitleCase(),
                durationShort: translations.nmonth(1),
                price: "€2,99",
                dealPercentage: 0,
                productDetails: "Dynamic purchase data",
                currencySymbol: "€",
                rawPrice: 2.99,
                monthText: translations.month,
                duration: "P1M",
                index: 1)
          ],
          // Shown if isPurchaseSuccess == true
          successTitle: "Success!!",
          // Shown if isPurchaseSuccess == true
          successSubTitle: "Thanks for choosing Premium!",
          // Widget can be anything. Shown if isPurchaseSuccess == true
          successWidget: Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  child: Text("Let's go!"),
                  onPressed: () {
                    print("let‘s go to the home widget again");
                  },
                )
              ])),
          // set true if subscriptions are loading
          isSubscriptionLoading: false,
          // if purchase is in progress, set to true. this will show a fullscreen progress indicator
          isPurchaseInProgress: false,
          // to show the success widget
          purchaseState: PurchaseState.NOT_PURCHASED,
          // callback Interface for restore and purchase tap events. Extend DefaultPurchaseHandler
          callbackInterface: purchaseHandler,
          purchaseStateStreamInterface: purchaseHandler,
          // provide your TOS
          tosData:
              TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
          // provide your PP
          ppData:
              TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
          // add a custom campaign widget
          /*campaignWidget: CampaignBanner(
            theme: Theme.of(context),
            headline: "🥳 Summer Special Sale",
            subContent: Container(
                padding: EdgeInsets.all(8),
                child: CountdownTimer(
                  endTime: DateTime.now()
                      .add(Duration(days: 2, hours: 7))
                      .millisecondsSinceEpoch,
                )),
          )*/),
    );
  }
}

class PurchaseHandler extends DefaultPurchaseHandler {
  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    print("purchase start");
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    print("purchase done");
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
