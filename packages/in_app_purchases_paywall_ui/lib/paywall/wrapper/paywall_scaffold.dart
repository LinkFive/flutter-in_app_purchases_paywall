import 'package:flutter/material.dart';

/// Wrap the Paywall in a Scaffold or use your own
/// It uses the Theme.of(context) if you don't provide your own theme
class PaywallScaffold extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;
  final String? appBarTitle;
  final ThemeData? theme;

  PaywallScaffold({required this.child, this.appBarTitle, this.theme = null});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = theme != null ? theme! : Theme.of(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          textTheme: _theme.textTheme,
          toolbarTextStyle: _theme.textTheme.headline6,
          actionsIconTheme: _theme.accentIconTheme,
          brightness: _theme.brightness,
          systemOverlayStyle: _theme.appBarTheme.systemOverlayStyle,
          iconTheme: _theme.primaryIconTheme,
          backgroundColor: _theme.primaryColor,
          title: Text(appBarTitle ?? "Premium"),
          elevation: 0.0,
          actions: [],
        ),
        body: child);
  }
}
