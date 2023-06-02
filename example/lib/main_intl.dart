import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.light),
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
      // set a theme
      // appBarTitle for scaffold
      appBarTitle: translations.week,
      child: SimplePaywall(
          // set a custom header
          headerContainer: Container(
              margin: EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.center,
                      image: AssetImage('assets/images/premium_bg.png'))),
              child: Container()),
          // Title Bar
          title: "Go Premium",
          // SubTitle
          subTitle: "All features at a glance",
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
                durationShort: translations.nyear(1).toTitleCase(),
                price: "€14,99€",
                dealPercentage: 69,
                productDetails: "Dynamic purchase data",
                index: 0),
            SubscriptionData(
                durationTitle: translations.quarterly.toTitleCase(),
                durationShort: translations.nmonth(3).toTitleCase(),
                price: "€6,99",
                dealPercentage: 42,
                productDetails: "Dynamic purchase data",
                index: 2),
            SubscriptionData(
                durationTitle: translations.monthly.toTitleCase(),
                durationShort: translations.nmonth(1).toTitleCase(),
                price: "3,99€",
                dealPercentage: 0,
                productDetails: "Dynamic purchase data",
                index: 3),
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
          campaignWidget: CampaignBanner(
            headline: "🥳 Summer Special Sale",
            subContent: Container(
                padding: EdgeInsets.all(8),
                child: CountdownTimer(
                  endTime: DateTime.now()
                      .add(Duration(days: 2, hours: 7))
                      .millisecondsSinceEpoch,
                )),
          )),
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
