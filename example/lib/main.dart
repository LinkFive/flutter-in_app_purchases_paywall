import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/subscription_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/widgets/campaign_banner.dart';

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
          primarySwatch: Colors.green, brightness: Brightness.light, iconTheme: IconThemeData(color: Colors.lightGreen)
          /*
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.purple,
        textTheme: TextTheme(
          button: TextStyle(color: Colors.blueGrey),
          headline5: TextStyle(color: Colors.amber),
          bodyText1: TextStyle(color: Colors.green),
          bodyText2: TextStyle(color: Colors.blue)
        ),
        primaryColor: Colors.cyan,
        accentColor: Colors.yellowAccent*/
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SimplePayWall(
      theme: Theme.of(context),
      appBarTitle: "Premium",
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
      title: "Go Premium",
      subTitle: "All features at a glance",
      bulletPoints: [
        IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
        IconAndText(Icons.hd, "Premium HD"),
        IconAndText(Icons.sort, "Access to All Premium Articles")
      ],
      subscriptionListData: [
        SubscriptionData(
            durationTitle: "Yearly",
            durationShort: "1 year",
            price: "€14,99€",
            dealPercentage: 69,
            onTap: () {
              print("click 1 year");
            },
            index: 0),
        /*
        SubscriptionData(
            durationTitle: "Biannual",
            durationShort: "6 Months",
            price: "9,99€",
            dealPercentage: 59,
            onTap: () {
              print("click");
            },
            index: 1),*/
        SubscriptionData(
            durationTitle: "Quarterly",
            durationShort: "3 Months",
            price: "€6,99",
            dealPercentage: 42,
            onTap: () {
              print("click");
            },
            index: 2),
        SubscriptionData(
            durationTitle: "Monthly",
            durationShort: "1 month",
            price: "3,99€",
            dealPercentage: 0,
            onTap: () {
              print("click");
            },
            index: 3)
      ],
      tosData: TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
      ppData: TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
      onRestoreTap: () {
        print("restore");
      },
      campaignWidget: CampaignBanner(
        theme: Theme.of(context),
        headline: "Buy Premium now",
        subTitle: "and support our great app",
      ),
    );
  }
}
