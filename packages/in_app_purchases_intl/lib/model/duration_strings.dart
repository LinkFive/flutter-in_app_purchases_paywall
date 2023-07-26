class DurationStrings {
  /// e.g. biannual
  final String durationText;

  /// e.g. 6 months
  final String durationTextNumber;

  /// e.g. monthly, quarterly, biannual
  final String durationType;

  /// e.g. 6
  final int durationNumber;

  DurationStrings(
      {required this.durationText,
      required this.durationTextNumber,
      required this.durationType,
      required this.durationNumber});
}
