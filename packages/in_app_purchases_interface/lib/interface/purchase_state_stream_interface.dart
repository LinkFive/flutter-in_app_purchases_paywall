import 'package:in_app_purchases_interface/model/purchase_state.dart';

abstract class PurchaseStateStreamInterface {
  Stream<PurchaseState> purchaseStateStream();
  Stream<bool> purchaseInProgressStream();

  /// If the purchase state is NOT_PURCHASED, you
  /// might want to load your subscriptions from the stores.
  ///
  /// loadSubscriptions gets called whenever you should load
  /// the store information
  Future<bool> loadSubscriptions();
}
