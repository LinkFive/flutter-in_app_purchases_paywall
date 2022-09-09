abstract class ActivePlan {
  String get link;
}

///
/// Creates a Link to an active Plan on Google Play
///
class GooglePlayActivePlan extends ActivePlan {
  ///
  /// Also known as SKU
  ///
  final String productId;

  ///
  /// It's the App PackageName e.g. com.tnx.packed
  ///
  final String package;

  GooglePlayActivePlan(this.productId, this.package);

  @override
  String get link =>
      "https://play.google.com/store/account/subscriptions?sku=$productId&package=$package";
}

///
/// This is a general link to the Google Play Store
///
class GooglePlayGeneralActivePlan extends ActivePlan {
  @override
  String get link => "https://play.google.com/store/account/subscriptions";
}

///
/// Link to Apple App Store Subscription Page
///
class AppleAppStoreActivePlan extends ActivePlan {
  @override
  String get link => "https://apps.apple.com/account/subscriptions";
}
