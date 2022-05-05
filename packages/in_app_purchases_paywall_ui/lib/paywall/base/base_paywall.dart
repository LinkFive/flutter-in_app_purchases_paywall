import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/default/default_purchase_handler.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';

/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
///ignore: must_be_immutable
abstract class BasePaywall extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? continueText;
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
  BasePaywall(
      {this.title,
      this.subTitle,
      this.continueText,
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

    // if callbackInterface implements the purchase State interface
    // set callbackInterface as PurchaseStream
    if (purchaseStateStreamInterface == null &&
        this.callbackInterface is PurchaseStateStreamInterface) {
      // set purchaseStream to callbackInterface
      this.purchaseStateStreamInterface =
          this.callbackInterface as PurchaseStateStreamInterface;
    } else {
      // otherwise set the default handler
      this.purchaseStateStreamInterface =
          purchaseStateStreamInterface ?? defaultHandler;
    }
  }
}

/// State to control the State Streams
abstract class BasePaywallState<T extends BasePaywall> extends State<T> {
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

  /// This will wrap either the purchase widget or Success widget
  /// inside an inherited widget to pass the data to all children
  Widget get _dataWidget => PaywallDataIW(
        child: _getPurchaseOrSuccess,
        title: widget.title,
        subTitle: widget.subTitle,
        continueText: widget.continueText,
        tosData: widget.tosData,
        ppData: widget.ppData,
        bulletPoints: widget.bulletPoints,
        campaignWidget: widget.campaignWidget,
        restoreText: widget.restoreText,
        successTitle: widget.successTitle,
        successSubTitle: widget.successSubTitle,
        successWidget: widget.successWidget,
      );

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
        ThemeData _theme = Theme.of(context);

        // if State is purchased
        if (snapshot.hasData && snapshot.data == PurchaseState.PURCHASED) {
          return buildSuccess(context, _theme);
        } else {
          // if state is not purchased yet
          return buildPaywall(context, _theme);
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
          widget.headerContainer ?? SizedBox.shrink(),
          SubscriptionCallbackIW(
              child: _dataWidget,
              callbackInterface: widget.callbackInterface,
              subscriptionListData: widget.subscriptionListData)
        ])));

    // Loading indicator
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

    // Return the stack with paywall, loading indicator
    return Stack(children: stackItems);
  }

  /// Build of Paywall Page
  Widget buildPaywall(BuildContext context, ThemeData theme);

  /// Build of Success Page
  Widget buildSuccess(BuildContext context, ThemeData theme);
}
