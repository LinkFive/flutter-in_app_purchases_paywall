import 'package:flutter/cupertino.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_interface/interface/callback_interface.dart';

/// Basic Widget class
abstract class BasicStatelessWidget extends StatelessWidget {
  List<SubscriptionData>? subscriptionListData = null;

  /// Custom interface which gets called for tap events
  CallbackInterface? callbackInterface = null;

  BasicStatelessWidget(
      {this.callbackInterface, this.subscriptionListData = null}) {
    sortSubscriptions();
  }

  /// Sort all subscriptions by the index
  sortSubscriptions() {
    this.subscriptionListData?.sort((a, b) => a.index.compareTo(b.index));
  }

  /// Call restore if the interface is not null
  void onRestoreTap() {
    callbackInterface?.restore();
  }

  /// Call restore on interface if not null. Otherwise call onTap on SubscriptionData if not null.
  void onPurchase(SubscriptionData subscriptionData) {
    if (callbackInterface != null) {
      callbackInterface!.purchase(subscriptionData);
    } else {
      if (subscriptionData.onTap != null) {
        subscriptionData.onTap!();
      }
    }
  }
}
