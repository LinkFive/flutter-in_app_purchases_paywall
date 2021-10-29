import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/interface/purchase_state_stream_interface.dart';
import 'package:in_app_purchases_interface/model/purchase_state.dart';
import 'package:in_app_purchases_paywall_ui/paywall/default/default_purchase_handler.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';

/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
class SimplePaywall extends StatefulWidget {
  final ThemeData? theme;
  final String? title;
  final String? subTitle;
  final TextAndUrl? tosData;
  final TextAndUrl? ppData;
  final Widget? headerContainer;
  final List<IconAndText>? bulletPoints;
  final Widget? campaignWidget;
  final String? restoreText;
  final String? successTitle;
  final String? successSubTitle;
  final Widget? successWidget;
  late bool isSubscriptionLoading;
  late bool isPurchaseInProgress;
  late PurchaseState purchaseState;
  late CallbackInterface callbackInterface;
  late PurchaseStateStreamInterface purchaseStateStreamInterface;
  final List<SubscriptionData>? subscriptionListData;

  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal)
  SimplePaywall(
      {this.theme,
      this.title,
      this.subTitle,
      this.tosData,
      this.ppData,
      this.headerContainer,
      this.bulletPoints,
      this.campaignWidget,
      this.restoreText,
      this.successTitle,
      this.successSubTitle,
      this.successWidget,
      this.isSubscriptionLoading = false,
      this.isPurchaseInProgress = false,
      this.purchaseState = PurchaseState.NOT_PURCHASED,
      this.subscriptionListData = null,
      CallbackInterface? callbackInterface = null,
      PurchaseStateStreamInterface? purchaseStateStreamInterface = null}) {
    // sort Subscriptions to index
    this.subscriptionListData?.sort((a, b) => a.index.compareTo(b.index));

    // Default handler if no callback is defined
    var defaultHandler = DefaultPurchaseHandler(
        initialPurchaseState: this.purchaseState,
        initialIsPurchaseInProgress: this.isPurchaseInProgress);

    // use this callbackInterface
    this.callbackInterface = callbackInterface ?? defaultHandler;

    // if purchaseState is null &
    // callbackInterface implements the purchase State interface
    // set callbackInterface as PurchaseStream
    if (purchaseStateStreamInterface == null &&
        this.callbackInterface is PurchaseStateStreamInterface) {
      // set purchaseStream to callbackInterface
      this.purchaseStateStreamInterface =
          callbackInterface as PurchaseStateStreamInterface;
    } else {
      // otherwise set the default handler
      this.purchaseStateStreamInterface =
          purchaseStateStreamInterface ?? defaultHandler;
    }
  }

  @override
  State createState() => _SimplePaywallState();
}

/// State to control the State Streams
class _SimplePaywallState extends State<SimplePaywall> {
  /// Stream Subscription PurchaseState
  late Stream<PurchaseState> purchaseStateStream;

  /// Stream Subscription Purchase In Progress
  late Stream<bool> purchaseInProgressStream;

  @override
  void initState() {
    purchaseStateStream =
        widget.purchaseStateStreamInterface.purchaseStateStream();
    purchaseInProgressStream =
        widget.purchaseStateStreamInterface.purchaseInProgressStream();
    super.initState();
  }

  /// returns either the Purchase Widget or the Success Widget
  Widget get _getPurchaseOrSuccess {
    return StreamBuilder<PurchaseState>(
      stream: purchaseStateStream,
      builder: (context, snapshot) {
        // if there is no data yet, show a progress Indicator
        if (!snapshot.hasData) {
          return Container(
              height: 10000,
              width: 10000,
              child: Center(child: CircularProgressIndicator()));
        }

        // use the theme of the context if not set
        ThemeData _theme =
            widget.theme != null ? widget.theme! : Theme.of(context);

        // if State is purchased
        if (snapshot.hasData && snapshot.data == PurchaseState.PURCHASED) {
          return SimplePaywallSuccess(
            theme: _theme,
            headerContainer: widget.headerContainer,
            successTitle: widget.successTitle,
            successSubTitle: widget.successSubTitle,
            successWidget: widget.successWidget,
          );
        } else {
          // if state is not purchased yet
          return SimplePaywallPurchase(
              theme: _theme,
              title: widget.title,
              subTitle: widget.subTitle,
              tosData: widget.tosData,
              ppData: widget.ppData,
              headerContainer: widget.headerContainer,
              bulletPoints: widget.bulletPoints,
              campaignWidget: widget.campaignWidget,
              restoreText: widget.restoreText,
              callbackInterface: widget.callbackInterface,
              isSubscriptionLoading: widget.isSubscriptionLoading);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack items. UI then Loading screen
    List<Widget> stackItems = [];
    stackItems.add(GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.red,
        child: ListView(children: <Widget>[
          widget.headerContainer ?? Container(),
          SubscriptionCallbackIW(
              child: _getPurchaseOrSuccess,
              callbackInterface: widget.callbackInterface,
              subscriptionListData: widget.subscriptionListData)
        ])));
    stackItems.add(StreamBuilder<bool>(
        stream: purchaseInProgressStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
              backgroundColor: Color(0x22000000),
            );
          }
          return Container();
        }));
    return Stack(children: stackItems);
  }
}
