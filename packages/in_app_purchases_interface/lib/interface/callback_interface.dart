import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

///
/// This plugin is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
/// This is the main Callback Interface that interacts with the UI to restore
/// or purchase a product
///
abstract class CallbackInterface {
  /// Restore the Purchase
  Future<bool> restore();
  // Make a Purchase
  Future<bool> purchase(SubscriptionData productDetails);
}
