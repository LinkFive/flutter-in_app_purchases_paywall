import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';

class MoritzPriceBox extends StatelessWidget {
  final ThemeData themeData;
  final SubscriptionData data;
  final double width;
  final bool highlight;
  final Function(int index) onSelectIndex;

  /// used to change text color inside the box to primary.
  /// Otherwise the text color is too bright on the box
  final bool isLightBrightness;

  final widthMargin = 8;

  MoritzPriceBox(
      this.themeData, this.data, this.width, this.highlight, this.onSelectIndex)
      : isLightBrightness = themeData.brightness == Brightness.light {}

  Widget get highlightedWidget {
    if (data.highlightText == null) {
      return Container(
        height: 30,
      );
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

  /// calculates the price per Month
  Widget get pricePerMonthWidget {
    // if some of those are missing, show nothing
    if (data.rawPrice == null ||
        data.currencySymbol == null ||
        data.duration == null) {
      return SizedBox.shrink();
    }

    // the amount of months
    double months = 1;
    switch (data.duration) {
      case "P1W":
        months = 0.25;
        break;
      case "P3M":
        months = 3;
        break;
      case "P6M":
        months = 6;
        break;
      case "P1Y":
      case "P12M":
        months = 12;
        break;
    }
    double pricePerMonth = data.rawPrice! / months;
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${pricePerMonth.toStringAsFixed(2)}${data.currencySymbol}",
              style: isLightBrightness
                  ? themeData.textTheme.subtitle1
                  : themeData.textTheme.subtitle1
                      ?.apply(color: highlight ? null : themeData.primaryColor),
            ),
            Text("/${data.monthText ?? "month"}",
                style: isLightBrightness
                    ? themeData.textTheme.subtitle2
                    : themeData.textTheme.subtitle2?.apply(
                        color: highlight ? null : themeData.primaryColor))
          ]),
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
        height: 70,
        alignment: Alignment.center,
        child: data.dealPercentage > 0
            ? Text("-${data.dealPercentage}%",
                style: textStyle?.apply(
                    color: highlight && !isLightBrightness
                        ? null
                        : themeData.primaryColor,
                    fontWeightDelta: 2,
                    fontStyle: FontStyle.italic))
            : null);
  }

  Widget get dividerWidget => Container(
        decoration: BoxDecoration(color: Colors.grey.shade400),
        width: width / 2,
        height: 1,
      );

  /// Total Price
  Widget get priceWidget {
    TextStyle? textStyle = themeData.textTheme.subtitle1;
    if (highlight) {
      textStyle = textStyle?.apply(fontWeightDelta: 1);
    }
    if (!isLightBrightness) {
      textStyle =
          textStyle?.apply(color: highlight ? null : themeData.primaryColor);
    }
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        "${data.price}",
        style: textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectIndex(data.index);
      },
      child: Column(children: [
        Container(
          width: width,
          height: 16,
        ),
        highlightedWidget,
        Container(
            decoration: BoxDecoration(
              color: highlight
                  ? themeData.primaryColor
                  : themeData.backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: width - widthMargin - 8,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: highlight
                    ? themeData.scaffoldBackgroundColor
                    : themeData.backgroundColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    "${data.durationShort.replaceAll(" ", "\n")}",
                    textAlign: TextAlign.center,
                    style: themeData.brightness == Brightness.light
                        ? themeData.textTheme.headline6
                            ?.apply(fontWeightDelta: 2)
                        : themeData.textTheme.headline6?.apply(
                            color: highlight ? null : themeData.primaryColor,
                            fontWeightDelta: 2),
                  ),
                  pricePerMonthWidget,
                  percentageWidget,
                  dividerWidget,
                  priceWidget
                ],
              ),
            ))
      ]),
    );
  }
}
