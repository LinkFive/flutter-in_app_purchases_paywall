
import 'package:flutter/material.dart';

class SubscriptionData {
  int dealPercentage;
  String durationTitle;
  String durationShort;
  String price;
  int index;
  VoidCallback? onTap;

  SubscriptionData(
      {required this.durationTitle,
      required this.durationShort,
      required this.price,
      this.dealPercentage = 0,
      this.index = 0,
      this.onTap = null});
}
