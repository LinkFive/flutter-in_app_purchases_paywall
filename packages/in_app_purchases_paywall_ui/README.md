# In App Purchases Paywall UI for Flutter

## Current Designs
We have a few premade UI elements for paywalls

### Simple Paywall
Light Design:
<img src="./images/simple1_light.png" alt="Simple Paywall dark" height="750"/>
Dark Design:
<img src="./images/simple1_dark.png" alt="Simple Paywall dark" height="750"/>

#### implement
Example usage:
```dart
SimplePayWallScaffold(
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
    headline: "🥳 Summer Special Sale",
    subContent: Container(
        padding: EdgeInsets.all(8),
        child: CountdownTimer(
          endTime: DateTime.now().add(Duration(days: 2, hours: 7)).millisecondsSinceEpoch,
        )),
  ),
);
```

#### Change colors and font
```dart
MaterialApp(
  title: 'PayWall UI',
  theme: ThemeData(
    primarySwatch: Colors.green, // General Swatch Color
    brightness: Brightness.light, // Switch between light and dark design
    iconTheme: IconThemeData(color: Colors.lightGreen), // Color your icons
    accentColor: Colors.amber, // set your accent Color
    /* 
    And here are more themes you can change for this template
    
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
  home: MyHomePage()
);
```

