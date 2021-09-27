import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

abstract class CallbackInterface {

  Future<void> restore();
  Future<void> purchase(SubscriptionData productDetails);
}
