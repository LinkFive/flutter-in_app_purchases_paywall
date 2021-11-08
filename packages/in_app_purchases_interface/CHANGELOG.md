## next
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
