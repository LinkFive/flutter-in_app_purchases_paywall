import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/paywall_data_iw.dart';
import 'package:in_app_purchases_paywall_ui/paywall/inherit/subscription_callback_iw.dart';

class MoritzPriceBox extends StatelessWidget {
  final ThemeData themeData;
  final SubscriptionData data;
  final double width;

  final widthMargin = 8;

  MoritzPriceBox(this.themeData, this.data, this.width);

  Widget get highlightedWidget {
    if(data.highlightText == null){
      return Container(height: 30,);
    }
    return Container(
      decoration: ShapeDecoration(
        color: themeData.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      ),
      height: 30,
      width: width - widthMargin,
      child: Align(
        child: Text(
          data.highlightText!,
          style:
              themeData.textTheme.bodyText1?.apply(color: themeData.cardColor),
        ),
        alignment: Alignment.center,
      ),
    );
  }

  Widget get priceWidget {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        "${data.price}",
        style: themeData.textTheme.subtitle1,
      ),
    );
  }

  Widget get percentageWidget {
    TextStyle? textStyle = themeData.textTheme.headline6;
    if (data.dealPercentage >= 50) {
      textStyle = themeData.textTheme.headline4?.apply(fontWeightDelta: 3);
    } else if (data.dealPercentage >= 30) {
      textStyle = themeData.textTheme.headline5?.apply(fontWeightDelta: 1);
    }
    return Container(
        height: 80,
        alignment: Alignment.center,
        child: data.dealPercentage > 0
            ? Text("-${data.dealPercentage}%",
                style: textStyle?.apply(color: themeData.primaryColor))
            : null);
  }

  Widget get dividerWidget => Container(
        decoration: BoxDecoration(color: Colors.grey.shade400),
        width: width / 2,
        height: 1,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SubscriptionCallbackIW.of(context)?.onPurchase(data);
      },
      child: Column(children: [
        Container(
          width: width,
          height: 16,
        ),
        highlightedWidget,
        Container(
          width: width - widthMargin,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(color: themeData.hoverColor),
          child: Column(
            children: [
              Text(
                "${data.durationShort.replaceAll(" ", "\n")}",
                textAlign: TextAlign.center,
                style: themeData.textTheme.headline6,
              ),
              percentageWidget,
              dividerWidget,
              priceWidget
            ],
          ),
        )
      ]),
    );
  }
}
