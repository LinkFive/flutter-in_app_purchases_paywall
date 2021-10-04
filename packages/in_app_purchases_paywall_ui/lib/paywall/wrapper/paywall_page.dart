import 'package:flutter/material.dart';

/// Wrap the Paywall in a Page or use it with flutter navigation 2.0
class PaywallPage extends Page {
  final Widget child;

  PaywallPage({required this.child, String key = "paywall"})
      : super(key: ValueKey(key));

  @override
  Route createRoute(BuildContext context) => MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return child;
        },
      );
}
