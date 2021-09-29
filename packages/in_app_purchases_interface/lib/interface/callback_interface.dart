import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

abstract class CallbackInterface {
  Future<bool> restore();
  Future<bool> purchase(SubscriptionData productDetails);
}
