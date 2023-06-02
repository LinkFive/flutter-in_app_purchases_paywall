import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/default/default_purchase_handler.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/paywall_data.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/active_plan.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:responsive_spacing/widgets/spacing.dart';

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
  final List<ActivePlan>? activePlanList;

  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  BasePaywall(
      {super.key,
      this.title,
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
      this.subscriptionListData,
      this.activePlanList,
      CallbackInterface? callbackInterface,
      PurchaseStateStreamInterface? purchaseStateStreamInterface}) {
    // sort Subscriptions to index
    subscriptionListData?.sort((a, b) => a.index.compareTo(b.index));

    // Default handler if no callback is defined
    var defaultHandler =
        DefaultPurchaseHandler(initialPurchaseState: purchaseState, initialIsPurchaseInProgress: isPurchaseInProgress);

    // use this callbackInterface
    this.callbackInterface = callbackInterface ?? defaultHandler;

    // if callbackInterface implements the purchase State interface
    // set callbackInterface as PurchaseStream
    if (purchaseStateStreamInterface == null && this.callbackInterface is PurchaseStateStreamInterface) {
      // set purchaseStream to callbackInterface
      this.purchaseStateStreamInterface = this.callbackInterface as PurchaseStateStreamInterface;
    } else {
      // otherwise set the default handler
      this.purchaseStateStreamInterface = purchaseStateStreamInterface ?? defaultHandler;
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
    purchaseStateStream = widget.purchaseStateStreamInterface.purchaseStateStream();
    purchaseInProgressStream = widget.purchaseStateStreamInterface.purchaseInProgressStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Return the stack with paywall, loading indicator
    return LayoutBuilder(
      builder: (context, constraints) => Spacing(
        width: constraints.maxWidth,
        child: Builder(builder: (context) {
          // Stack items. UI then Loading screen
          return Stack(children: [
            // FIRST ITEM IS UI
            GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.red,
                child: ListView(children: [
                  if (widget.headerContainer != null) widget.headerContainer!,
                  SubscriptionCallbackIW(
                      /// This will wrap either the purchase widget or Success widget
                      /// inside an inherited widget to pass the data to all children
                      child: PaywallDataIW(
                        /// returns either the Purchase Widget or the Success Widget
                          child: StreamBuilder<PurchaseState>(
                            stream: purchaseStateStream,
                            builder: (context, snapshot) {
                              // if there is no data yet, show a progress Indicator
                              if (!snapshot.hasData) {
                                return Container(height: 10000, width: 10000, child: Center(child: const CircularProgressIndicator()));
                              }

                              // if State is purchased
                              if (snapshot.hasData && snapshot.data == PurchaseState.PURCHASED) {
                                return buildSuccess(context);
                              } else {
                                // if state is not purchased yet
                                return buildPaywall(context);
                              }
                            },
                          ),
                          paywallData: PaywallData(
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
                              activePlanList: widget.activePlanList)),
                      callbackInterface: widget.callbackInterface,
                      subscriptionListData: widget.subscriptionListData)
                ])),

            // LOADING INDICATOR
            StreamBuilder<bool>(
                stream: purchaseInProgressStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                      backgroundColor: Color(0x22000000),
                    );
                  }
                  return const SizedBox.shrink();
                })
          ]);
        }),
      ),
    );
  }

  /// Build of Paywall Page
  Widget buildPaywall(BuildContext context);

  /// Build of Success Page
  Widget buildSuccess(BuildContext context);
}
