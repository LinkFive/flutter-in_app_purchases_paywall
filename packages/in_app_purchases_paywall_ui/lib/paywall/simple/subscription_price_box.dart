import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/subscription_data.dart';

class SubscriptionPriceBox extends StatelessWidget {
  final SubscriptionData data;
  final ThemeData theme;
  final bool shouldBreakText;
  final int mx;

  SubscriptionPriceBox(this.data, this.theme, this.shouldBreakText, {this.mx = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: mx * 4, right: mx * 4, top: 4, bottom: 4),
          child: Ink(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: theme.primaryColor),
              child: InkWell(
                  onTap: data.onTap,
                  child: Padding(
                      padding: EdgeInsets.all(1),
                      child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)), color: Color(0xccffffff)),
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
                                        style: theme.textTheme.button,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 4,
                                          right: 4,
                                        ),
                                        child: Text(
                                          "${data.price} /${shouldBreakText?"\n":" "}${data.durationShort.replaceAll(" ", "\u{00A0}")}",
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              data.dealPercentage > 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          color: theme.accentColor),
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text("-${data.dealPercentage}%"),
                                      ))
                                  : Container(),
                            ],
                          ))))),
        ));
  }
}
