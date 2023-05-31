class SubscriptionData {
  // if it's cheaper than any other subscription
  int dealPercentage;

  String durationTitle;

  String durationShort;

  /// Price as String
  String price;

  /// Raw Price e.g. 1.99
  double? rawPrice;

  /// Any currency like €, $.
  String? currencySymbol;

  /// Please use ISO_8601 Durations:
  /// P1W = 1 week
  /// P1M = 1 month
  /// P3M = 3 months
  /// P6M = 6 months
  /// P1Y = 1 Year
  String? duration;

  /// String of the text "month".
  /// E.g. if you want to show how much it is per month: 1.49€/month
  /// then we need the translated string. Fallback is "month"
  String? monthText;

  String? highlightText;

  int index;

  dynamic productDetails;

  SubscriptionData(
      {required this.durationTitle,
      required this.durationShort,
      required this.price,
      this.rawPrice,
      this.currencySymbol,
      this.duration,
      this.monthText,
      this.highlightText,
      this.dealPercentage = 0,
      this.index = 0,
      this.productDetails});
}
