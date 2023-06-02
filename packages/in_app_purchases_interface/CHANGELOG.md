## 1.0.0
* Flutter 3.10 Update
* Dart 3.0.0 Update

## 0.0.8
* switching from print to log
* clean up code
* update to flutter 2.10.4
* no major change in this version

Check out our other Flutter plugins on https://www.linkfive.io

## 0.0.7
SubscriptionData enhanced: added: rawPrice, currencySymbol, duration and monthText. 
if you pass the data, some uis will show the average price per month. (everything is optional) 

## 0.0.6
Changed PurchaseStateStreamInterface and added a new method you might want to override:

/// If the purchase state is NOT_PURCHASED, you
/// might want to load your subscriptions from the stores.
///
/// loadSubscriptions gets called whenever you should load
/// the store information
Future<bool> loadSubscriptions();

## 0.0.5
Add Subscription Duration data class

## 0.0.4
Add PurchaseInProgressStreamInterface for managing the loading State of a purchase
Add PurchaseStateStreamInterface for managing the purchase State. NOT_PURCHASED PURCHASED 
Add PurchaseState enum


## 0.0.3
callback interface changed from Future<void> to Future<bool> to handle success and error purchases

## 0.0.2
add dynamic productDetails to SubscriptionData

## 0.0.1
initial interface classes
