This package is an in app purchases paywall UI for Flutter. Ready for Dart 3 and Flutter 3.10

# Paywall design for everyone
This simple to use Paywall UI is developed for the flutter community. Fully customizable and easy to integrate.

## Design 1: Simple Paywall
The Simple Paywall design is a basic design without any animations

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/simple_paywall_all.png" alt="Simple Paywall"/>

## Design 2: Moritz Paywall
The second Paywall designed by Moritz is available from version 0.5 and upwards.

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/moritz_paywall_all.png" alt="Moritz Paywall"/>

## Easy integration
Use the SimplePaywall without a Scaffold or wrap the Paywall in a PaywallScaffold

```dart
// Use the Scaffold to also show an App Bar
PaywallScaffold(
  appBarTitle: "Premium",
  child: // your Paywall as a child
);

SimplePaywall(
  // ...
)

MoritzPaywall(
  // ...
)
```

### Flutter Navigation 2.0 Page
If you use flutter navigation 2.0 you might want to wrap the scaffold in a page element or use the class PaywallPage:
```dart
class PremiumPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PaywallScaffold(
          // ...
        );
      },
    );
  }
}
```

## State control included

Control the State: *PURCHASED* to show the Success Page or *Purchase in Progress* to show a fullscreen loading indicator.

```dart
SimplePaywall(
  // add your handler -> extend DefaultPurchaseHandler
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

## Success Page linked to the subscription page

Starting September 30, 2022, every app must include a deep link to the store's subscription page. We have added the link on the success page.

You can add the link by adding an ActivePlan object to the Paywall:

```dart
activePlanList: [
  // links to the subscription overview on Android devices:
  GooglePlayGeneralActivePlan(), 

  // links to the specific subscription on Android devices: 
  GooglePlayActivePlan("yearly_pro", "com.tnx.packed"),

  // links to the subscription overview on iOS devices
  AppleAppStoreActivePlan(), 
],
```

Here are the specific App Store docs:

* [Apple App Store Guideline](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/handling_subscriptions_billing)
* [Google Play Store Guideline](https://developer.android.com/google/play/billing/subscriptions#deep-link)

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/active_plan_link.png" alt="Active Plan"/>

---

## Easy Integration with linkfive_purchases library
Since [LinkFive](https://www.linkfive.io) is using **[in_app_purchase package](https://pub.dev/packages/in_app_purchase)** as a dependency, the integration is seamless and effortless. 

Pub.dev plugin: **[linkfive_purchases package](https://pub.dev/packages/linkfive_purchases)**

```dart

// get subscription data from your provider or from your stream (as described above)
LinkFiveProducts? products = // your products you got through the products Stream

SimplePaywall(
  // ...
  // basically just the linkFivePurchases class
  callbackInterface: LinkFivePurchases.callbackInterface,

  // you can use your own strings or use the intl package to automatically generate the subscription strings
  subscriptionListData: products?.paywallUIHelperData(context: context) ?? [],
  // ...
);
```

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/linkfive-and-flutter-works-best.png" alt="LinkFive and Flutter works perfectly together"/>

Read more about an easy [Flutter Paywall Integration](https://www.linkfive.io/flutter-integration/?ref=github&utm_source=github&utm_medium=paywall_link)

## LinkFive Provider Plugin (easiest version)
LinkFive created a provider plugin which you can use out of the box: [linkfive_purchases_provider](https://pub.dev/packages/linkfive_purchases_provider)

**For a fully working paywall including state management**. Register the module:

```dart
MultiProvider(
  providers: [
    // ...
    ChangeNotifierProvider(
      create: (context) => LinkFiveProvider("API_KEY"),
      lazy: false,
    ),
  ]
)
```

And pass the callback and pass the subscriptionData from [linkfive_purchases_provider](https://pub.dev/packages/linkfive_purchases_provider)
```dart
PaywallScaffold(
  child: SimplePaywall(
    callbackInterface: LinkFivePurchases.callbackInterface,
    subscriptionListData: provider.getSubscriptionListData(context),
    // ...
  )
)
```

Now you have a **fully functional subscription system**.

---

## Navigator 2.0 & Provider Example
Check out the following example: [Provider and Navigator Example](https://pub.dev/packages/linkfive_purchases/example)

---

## Responsive layout for Tablet

We added the library [responsive_spacing](https://pub.dev/packages/responsive_spacing) to make the paywall a bit more responsive. On lage screens, it adds margin and breaks the layout into 2 columns.

<img src="https://raw.githubusercontent.com/LinkFive/flutter-in_app_purchases_paywall/master/packages/in_app_purchases_paywall_ui/resources/tablet-landscape.png" alt="tablet-landscape"/>

---

## implement

### Example usage Simple Paywall:
```dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PurchaseHandler purchaseHandler = PurchaseHandler();

  @override
  Widget build(BuildContext context) {
    return PaywallScaffold(
      // appBarTitle for scaffold
      appBarTitle: "Premium",
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

#### Change colours and font
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // custom icon theme
        iconTheme: IconThemeData(color: Colors.green),
        // your colorScheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
      ),
      home: MyHomePage(),
    );
  }
}
```

### Example: Moritz Paywall
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

          // custom icon theme
          iconTheme: IconThemeData(color: Colors.lightGreen),

          // color scheme
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.light),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.green)
          )
      ),
      supportedLocales: [
        const Locale('en'),
        const Locale('de'),
      ],
      localizationsDelegates: [
        PaywallLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
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
              durationTitle: translations.quarterly.toTitleCase(),
              durationShort: translations.nmonth(3),
              price: "€8,99",
              dealPercentage: 42,
              productDetails: "Dynamic purchase data",
              currencySymbol: "€",
              rawPrice: 8.99,
              monthText: translations.month,
              duration: "P3M",
              index: 2),
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
```
