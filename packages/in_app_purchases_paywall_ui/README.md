This package is an in app purchases paywall UI for Flutter

# Paywall design for everyone
This simple to use Paywall UI is developed for the flutter community. Fully customizable and easy to integrate.

## Simple Paywall
The Simple Paywall design is a basic design without any animations

### Purchase Page
<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/simple_paywall_design.png" alt="Simple Paywall"/>

### Success Page
<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/simple_paywall_design_success.png" alt="Simple Paywall Success"/>

### Easy integration
Use the SimplePaywall without a Scaffold or wrap the Paywall in a PaywallScaffold

```dart
PaywallScaffold(
  theme: Theme.of(context),
  appBarTitle: "Premium",
  child: SimplePaywall(
    theme: Theme.of(context)
    // ...
  )
);
```

### State control included

Control the State: *PURCHASED* to show the Success Page or *Purchase in Progress* for a fullscreen loading indicator.

```dart
SimplePaywall(
  callbackInterface: purchaseHandler,
  purchaseStateStreamInterface: purchaseHandler,
  // ...
)
```

To control the state, extend DefaultPurchaseHandler and implement your own logic.

```dart
class PurchaseHandler extends DefaultPurchaseHandler {
  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    // show loading
    isPendingPurchase = true;
    // your logic
    await Future.delayed(Duration(seconds: 1));
    // show success purchase and end loading
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    // show loading
    isPendingPurchase = true;
    // your logic
    await Future.delayed(Duration(seconds: 1));
    // show success purchase and end loading
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}
```

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/state_management_control.gif" alt="Simple Paywall Success state"/>

---

## Easy Integration with in_app_purchase library
This UI library is build for an easy integration with the flutter library in_app_purchase.

* Example & Package coming soon. **[in_app_purchase package](https://pub.dev/packages/in_app_purchase)**

## Easy Integration with linkfive_purchases library
Since LinkFive is using in_app_purchase as a dependency, the integration is seamless **[linkfive_purchases package](https://pub.dev/packages/linkfive_purchases)**

* Example & Package coming soon.


## Navigator 2.0 Example
* Example & Package coming soon.


## Provider example
* Example & Package coming soon.


## Riverpod example
* Example & Package coming soon.

---

## implement
Example usage:
```dart
class _MyHomePageState extends State<MyHomePage> {
  PurchaseHandler purchaseHandler = PurchaseHandler();
  @override
  Widget build(BuildContext context) {
    return PaywallScaffold(
      // set a theme
      theme: Theme.of(context),
      // appBarTitle for scaffold
      appBarTitle: "Premium",
      child: SimplePaywall(
        // set a theme
          theme: Theme.of(context),
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
                durationTitle: "Yearly",
                durationShort: "1 year",
                price: "€14,99€",
                dealPercentage: 69,
                productDetails: "Dynamic purchase data",
                index: 0),
            SubscriptionData(
                durationTitle: "Quarterly",
                durationShort: "3 Months",
                price: "€6,99",
                dealPercentage: 42,
                productDetails: "Dynamic purchase data",
                index: 2),
            SubscriptionData(
                durationTitle: "Monthly",
                durationShort: "1 month",
                price: "3,99€",
                dealPercentage: 0,
                productDetails: "Dynamic purchase data",
                index: 3)
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
            theme: Theme.of(context),
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
```

### Change colours and font
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

