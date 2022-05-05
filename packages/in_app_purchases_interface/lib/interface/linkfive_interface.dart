import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';

///
/// This plugin is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
/// This class is deprecated. please use the official LinkFive Class
///
@deprecated
abstract class LinkFiveInterface extends CallbackInterface {
  Future<void> init(String apiKey,
      {LinkFiveLogLevel logLevel = LinkFiveLogLevel.DEBUG,
      LinkFiveEnvironment env = LinkFiveEnvironment.PRODUCTION});

  Future<void> fetchSubscriptions();

  void setUTMSource(String? utmSource);

  void setEnvironment(String? environment);

  void setUserId(String? userId);
}
