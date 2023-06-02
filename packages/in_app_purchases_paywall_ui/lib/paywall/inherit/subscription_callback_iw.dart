import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

/// Inherited Widget to pass subscriptions and callbackInterface
class SubscriptionCallbackIW extends InheritedWidget {
  /// All subscription Data
  final List<SubscriptionData>? subscriptionListData;

  /// Custom interface which gets called for tap events
  final CallbackInterface callbackInterface;

  SubscriptionCallbackIW(
      {required super.child,
      required this.callbackInterface,
      this.subscriptionListData});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  /// Purchase will first try to call the interface and if null the subscriptionData.onTap
  void onPurchase(SubscriptionData subscriptionData) {
    callbackInterface.purchase(subscriptionData);
  }

  /// Call restore if the interface is not null
  void onRestoreTap() {
    callbackInterface.restore();
  }

  static SubscriptionCallbackIW? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SubscriptionCallbackIW>();
  }
}
