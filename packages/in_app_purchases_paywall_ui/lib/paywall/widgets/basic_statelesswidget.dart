import 'package:flutter/cupertino.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_interface/interface/callback_interface.dart';

abstract class BasicStatelessWidget extends StatelessWidget {
  List<SubscriptionData>? subscriptionListData = null;

  CallbackInterface? callbackInterface = null;

  BasicStatelessWidget({this.callbackInterface, this.subscriptionListData = null}) {
    sortSubscriptions();
  }

  sortSubscriptions() {
    this.subscriptionListData?.sort((a, b) => a.index.compareTo(b.index));
  }

  void onRestoreTap() {
    callbackInterface?.restore();
  }

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
