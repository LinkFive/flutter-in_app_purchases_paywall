# In App Purchases Paywall UI for Flutter

## Current Designs
We have a few premade UI elements for your custom paywalls. (more UI will follow soon)

### Simple Paywall
Light Design:
<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/simple1_light.png" alt="Simple Paywall light" height="600"/>
Dark Design:
<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/simple1_dark.png" alt="Simple Paywall dark" height="600"/>

#### implement
Example usage:
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SimplePayWallScaffold(
      // set a theme
      theme: Theme.of(context),
      // appBarTitle for scaffold
      appBarTitle: "Premium",
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
      // Your subscriptions, you want to offer
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
      // set true if subscriptions are loading
      isSubscriptionLoading: false,
      // if purchase is in progress, set to true. this will show a fullscreen progress indicator
      isPurchaseInProgress: false,
      // provide your TOS
      tosData: TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
      // provide your PP
      ppData: TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
      // if user clicks on Restore
      onRestoreTap: () {
        print("restore");
      },
      // add a custom campaign widget
      campaignWidget: CampaignBanner(
        theme: Theme.of(context),
        headline: "🥳 Summer Special Sale",
        subContent: Container(
            padding: EdgeInsets.all(8),
            child: CountdownTimer(
              endTime: DateTime.now().add(Duration(days: 2, hours: 7)).millisecondsSinceEpoch,
            )),
      ),
    );
  }
}
```

#### Change colours and font
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primary color schema
        primarySwatch: Colors.green,
        // set light or dark
        brightness: Brightness.light,
        // custom icon theme
        iconTheme: IconThemeData(color: Colors.lightGreen),
        // your accentColor
        accentColor: Colors.amber,
        /*
        // and many more color options
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
        primaryColorDark: Colors.green,
        primaryColorLight: Colors.blue
        accentColor: Colors.yellowAccent

        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.purple, onPrimary: Colors.red),
        )
        */
      ),
      home: MyHomePage(),
    );
  }
}
```

