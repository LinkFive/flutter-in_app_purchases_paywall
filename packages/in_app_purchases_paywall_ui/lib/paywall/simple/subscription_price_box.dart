import 'package:flutter/material.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

/// Price Box to show subscriptions
class SubscriptionPriceBox extends StatelessWidget {
  final SubscriptionData data;
  final Function(SubscriptionData) onPurchase;
  final ThemeData theme;
  final bool shouldBreakText;
  final int mx;
  final bool expandItems;

  SubscriptionPriceBox(
      this.data, this.onPurchase, this.theme, this.shouldBreakText,
      {this.mx = 1, this.expandItems = true});

  Widget get _expanded {
    return Expanded(child: _fixed);
  }

  Widget get _fixed {
    return Container(
      margin: EdgeInsets.only(left: mx * 4, right: mx * 4, top: 4, bottom: 4),
      child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: theme.primaryColorDark),
          child: InkWell(
              onTap: () {
                onPurchase(data);
              },
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: theme.primaryColorLight),
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
                                    style: theme.textTheme.bodyText1,
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
                                      style: theme.textTheme.bodyText2,
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
                                      color: theme.accentColor),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "-${data.dealPercentage}%",
                                      style: theme.accentTextTheme.caption,
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
      return _expanded;
    }
    return _fixed;
  }
}
