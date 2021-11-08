import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

abstract class CallbackInterface {
  /// Restore the Purchase
  Future<bool> restore();
  // Make a Purchase
  Future<bool> purchase(SubscriptionData productDetails);
}
