import 'package:in_app_purchases_interface/model/purchase_state.dart';

abstract class PurchaseStateStreamInterface {
  Stream<PurchaseState> purchaseStateStream();
  Stream<bool> purchaseInProgressStream();
}
