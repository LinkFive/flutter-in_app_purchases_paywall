import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_interface/linkfive/linkfive_environment.dart';
import 'package:in_app_purchases_interface/linkfive/linkfive_logger.dart';

abstract class LinkFiveInterface extends CallbackInterface {
  Future<void> init(String apiKey,
      {LinkFiveLogLevel logLevel = LinkFiveLogLevel.DEBUG,
      LinkFiveEnvironment env = LinkFiveEnvironment.PRODUCTION});

  Future<void> fetchSubscriptions();

  void setUTMSource(String? utmSource);

  void setEnvironment(String? environment);

  void setUserId(String? userId);
}
