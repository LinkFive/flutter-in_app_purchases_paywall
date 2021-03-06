import 'dart:developer';

/// Logger used by LinkFive applications
///
/// This class with change in the future and will be replaced by the official Logger
///
class LinkFiveLogger {
  static LinkFiveLogLevel _logLevel = LinkFiveLogLevel.DEBUG;

  LinkFiveLogger._();

  static setLogLevel(LinkFiveLogLevel logLevel) {
    _logLevel = logLevel;
  }

  static t(dynamic msg) {
    if (_logLevel.level() <= 0) {
      log("LinkFive: ${msg?.toString()}");
    }
  }

  static d(dynamic msg) {
    if (_logLevel.level() <= 1) {
      log("LinkFive: ${msg?.toString()}");
    }
  }

  static i(dynamic msg) {
    if (_logLevel.level() <= 2) {
      log("LinkFive: ${msg?.toString()}");
    }
  }

  static w(dynamic msg) {
    if (_logLevel.level() <= 3) {
      log("LinkFive: ${msg?.toString()}");
    }
  }

  static e(dynamic msg) {
    if (_logLevel.level() <= 4) {
      log("LinkFive: ${msg?.toString()}");
    }
  }
}

enum LinkFiveLogLevel { TRACE, DEBUG, INFO, WARN, ERROR }

extension LinkFiveLogLevelExtension on LinkFiveLogLevel {
  level() {
    switch (this) {
      case LinkFiveLogLevel.TRACE:
        return 0;
      case LinkFiveLogLevel.DEBUG:
        return 1;
      case LinkFiveLogLevel.INFO:
        return 2;
      case LinkFiveLogLevel.WARN:
        return 3;
      case LinkFiveLogLevel.ERROR:
        return 4;
    }
  }
}
