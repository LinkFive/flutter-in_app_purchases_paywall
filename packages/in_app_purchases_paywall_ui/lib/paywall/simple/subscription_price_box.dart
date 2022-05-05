import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';

/// Price Box to show subscriptions
class SubscriptionPriceBox extends StatelessWidget {
  final SubscriptionData data;
  final bool shouldBreakText;
  final int mx;
  final bool expandItems;

  SubscriptionPriceBox(this.data, this.shouldBreakText,
      {this.mx = 1, this.expandItems = true});

  Widget _expanded(BuildContext context) {
    return Expanded(child: _fixed(context));
  }

  Widget _fixed(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: mx * 4, right: mx * 4, top: 4, bottom: 4),
      child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Theme.of(context).colorScheme.primary),
          child: InkWell(
              onTap: () {
                SubscriptionCallbackIW.of(context)?.onPurchase(data);
              },
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
                              child: Column(
                                children: [
                                  Text(
                                    data.durationTitle,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: expandItems ? 4 : 16,
                                        right: expandItems ? 4 : 16),
                                    child: Text(
                                      "${data.price} /${shouldBreakText ? "\n" : " "}${data.durationShort.replaceAll(" ", "\u{00A0}")}",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          data.dealPercentage > 0
                              ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "-${data.dealPercentage}%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.apply(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary),
                                    ),
                                  ))
                              : Container(),
                        ],
                      ))))),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (expandItems) {
      return _expanded(context);
    }
    return _fixed(context);
  }
}
