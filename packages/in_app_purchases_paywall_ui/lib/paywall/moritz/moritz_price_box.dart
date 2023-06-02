import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:responsive_spacing/responsive_spacing.dart';
import 'package:responsive_spacing/widgets/gutter.dart';

class MoritzPriceBox extends StatelessWidget {
  final SubscriptionData data;
  final double width;
  final bool highlight;
  final Function(int index) onSelectIndex;

  MoritzPriceBox(this.data, this.width, this.highlight, this.onSelectIndex);

  @override
  Widget build(BuildContext context) {

    final widthMargin = context.spacingConfig.padding.size;

    return GestureDetector(
      onTap: () {
        onSelectIndex(data.index);
      },
      child: Column(children: [
        GutterColumn(),
        _HighlightedWidget(data, width, widthMargin),
        Container(
            decoration: BoxDecoration(
              color: highlight
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: width - widthMargin - context.spacingConfig.padding.size/2,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.symmetric(vertical: context.spacingConfig.padding.size),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    data.durationShort.replaceAll(" ", "\n"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeightDelta: 2),
                  ),
                  _PricePerMonthWidget(data, highlight),
                  _PercentageWidget(data, highlight),
                  // divider
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).dividerColor),
                    width: width / 2,
                    height: 1,
                  ),
                  _PriceWidget(data, highlight)
                ],
              ),
            ))
      ]),
    );
  }
}

class _HighlightedWidget extends StatelessWidget {
  final SubscriptionData data;
  final double width;
  final double widthMargin;

  _HighlightedWidget(this.data, this.width, this.widthMargin);

  @override
  Widget build(BuildContext context) {
    if (data.highlightText == null) {
      return Container(
        height: 30,
      );
    }
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      ),
      height: 30,
      width: width - widthMargin,
      child: Align(
        child: Text(
          data.highlightText!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.apply(color: Theme.of(context).colorScheme.onPrimary),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class _PricePerMonthWidget extends StatelessWidget {
  final SubscriptionData data;
  final bool highlight;

  _PricePerMonthWidget(this.data, this.highlight);

  @override
  Widget build(BuildContext context) {
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
      padding: EdgeInsets.only(top: context.spacingConfig.padding.size),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${pricePerMonth.toStringAsFixed(2)}${data.currencySymbol}",
              style: Theme.of(context).textTheme.titleMedium?.apply(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            Text("/${data.monthText ?? "month"}",
                style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: Theme.of(context).colorScheme.onPrimaryContainer))
          ]),
    );
  }
}

class _PriceWidget extends StatelessWidget {
  final SubscriptionData data;
  final bool highlight;

  _PriceWidget(this.data, this.highlight);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.apply(color: Theme.of(context).colorScheme.onPrimaryContainer);
    if (highlight) {
      textStyle = textStyle?.apply(fontWeightDelta: 2);
    }

    return Container(
      margin: EdgeInsets.only(top: context.spacingConfig.padding.size),
      child: Text(
        data.price,
        style: textStyle,
      ),
    );
  }
}

class _PercentageWidget extends StatelessWidget {
  final SubscriptionData data;
  final bool highlight;

  _PercentageWidget(this.data, this.highlight);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    if (data.dealPercentage >= 50) {
      textStyle =
          Theme.of(context).textTheme.headlineSmall?.apply(fontWeightDelta: 3);
    } else if (data.dealPercentage >= 30) {
      textStyle =
          Theme.of(context).textTheme.titleLarge?.apply(fontWeightDelta: 1);
    }
    textStyle = textStyle?.apply(
        color: Theme.of(context).colorScheme.primary,
        fontWeightDelta: 2,
        fontStyle: FontStyle.italic);
    return Container(
        height: 70,
        alignment: Alignment.center,
        child: data.dealPercentage > 0
            ? Text("-${data.dealPercentage}%", style: textStyle)
            : null);
  }
}
