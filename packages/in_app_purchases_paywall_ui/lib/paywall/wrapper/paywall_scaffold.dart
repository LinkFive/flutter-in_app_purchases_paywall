import 'package:flutter/material.dart';

///
/// Wrap the Paywall in a Scaffold or use your own
/// It uses the Theme.of(context) if you don't provide your own theme
///
/// The Paywall Library is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
class PaywallScaffold extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;
  final String? appBarTitle;

  PaywallScaffold({super.key, required this.child, this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: appBarTitle != null ? Text(appBarTitle!) : null,
          elevation: 0.0,
          actions: [],
        ),
        body: child);
  }
}
