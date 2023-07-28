## 1.0.1
* The ActivePlan button now opens in externalApplication mode and opens the correct GooglePlay Plan Page.

## 1.0.0
* Flutter 3.10 Update
* Dart 3.0.0 Update

### Theme style changes
* `bodyText1` is now `bodyLarge`
* `bodyText2` is now `bodyMedium`
* `headline5` is now `headlineSmall`
* `headline6` is now `titleLarge`
* `button` is now `labelLarge`
* `bodyText1` is now `bodyLarge`
* `caption` is now `bodySmall`
* `subtitle2` is now `titleSmall`
* `subtitle1` is now `titleMedium`

### Responsive
* we added a new dependency responsive_spacing to modify the paywall to be a responsive. 

## 0.7.0
Starting September 30, 2022, every app must include a deep link to the store's subscription page. We have added the link on the success page.

* We added the possibility to add activePlanList to the widget. This will show a deeplink to the appstore page on the success page
* We also added the dependency in_app_purchases_intl for fallback strings.

## 0.6.0

* Use Theme.of(context) instead of passing a Theme now.
* Bugfixing a NPE when passing no parameters
* Flutter update to 2.10.4

Check out our other Flutter plugins on https://www.linkfive.io

## 0.5.1
Minor Design Fixes from Moritz himself.

## 0.5.0
Moritz Paywall. SubscriptionData can now hold more data and can show the average price per month. 
added a data inherited widget to not always pass the data through the widget-tree
use interface v0.0.7

## 0.4.0
interface v0.0.6 added loadSubscriptions to PurchaseStateStreamInterface to dynamically load the subscriptions if needed
Theme is now optional and uses the default context if null
added the linkfive provider example

## 0.3.2
Just updated the readme for pub.dev

## 0.3.1
Upgrade to Interface 0.0.5.
Add an empty page wrapper for Navigation 2.0

## 0.3.0
Add state control for purchase in progress and success
Add Default Purchase Handler to easy extend and manipulate the widget

## 0.2.0
Add success widget

## 0.1.2
Just more documentation and code formatting

## 0.1.1
Add possibility to add an interface to handle purchase and restore events.

## 0.1.0
First public version. Simple Paywall included
support for MaterialApp ThemeData

## 0.0.1
initial test
