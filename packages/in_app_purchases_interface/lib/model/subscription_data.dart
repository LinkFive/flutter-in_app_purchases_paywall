class SubscriptionData {
  int dealPercentage;
  String durationTitle;
  String durationShort;
  String price;
  String? highlightText;
  int index;
  dynamic productDetails;

  SubscriptionData(
      {required this.durationTitle,
      required this.durationShort,
      required this.price,
      this.highlightText,
      this.dealPercentage = 0,
      this.index = 0,
      this.productDetails = null});
}
