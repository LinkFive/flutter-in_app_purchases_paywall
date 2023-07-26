import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchases_intl/delegate/paywall_localizations_en.dart';
import 'package:in_app_purchases_intl/extensions/duration_extension.dart';
import 'package:in_app_purchases_intl/model/duration_strings.dart';

void main(){
  final l18n = PaywallLocalizationsEn();
  group('DurationExtension Test', () {
    test('test iso 8601 P1D', (){
      final DurationStrings durationString = "P1D".fromIso8601(l18n);
      expect(durationString.durationNumber, 1);
      expect(durationString.durationText, "day");
      expect(durationString.durationTextNumber, "1 day");
      expect(durationString.durationType, "day");
    });
    test('test iso 8601 P2D', (){
      final DurationStrings durationString = "P2D".fromIso8601(l18n);
      expect(durationString.durationNumber, 2);
      expect(durationString.durationText, "day");
      expect(durationString.durationTextNumber, "2 days");
      expect(durationString.durationType, "day");
    });
    test('test iso 8601 P1W', (){
      final DurationStrings durationString = "P1W".fromIso8601(l18n);
      expect(durationString.durationNumber, 1);
      expect(durationString.durationText, "weekly");
      expect(durationString.durationTextNumber, "1 week");
      expect(durationString.durationType, "week");
    });
    test('test iso 8601 P4W', (){
      final DurationStrings durationString = "P4W".fromIso8601(l18n);
      expect(durationString.durationNumber, 4);
      expect(durationString.durationText, "weekly");
      expect(durationString.durationTextNumber, "4 weeks");
      expect(durationString.durationType, "week");
    });
    test('test iso 8601 P1M', (){
      final DurationStrings durationString = "P1M".fromIso8601(l18n);
      expect(durationString.durationNumber, 1);
      expect(durationString.durationText, "monthly");
      expect(durationString.durationTextNumber, "1 month");
      expect(durationString.durationType, "month");
    });
    test('test iso 8601 P3M', (){
      final DurationStrings durationString = "P3M".fromIso8601(l18n);
      expect(durationString.durationNumber, 3);
      expect(durationString.durationText, "quarterly");
      expect(durationString.durationTextNumber, "3 months");
      expect(durationString.durationType, "month");
    });
    test('test iso 8601 P6M', (){
      final DurationStrings durationString = "P6M".fromIso8601(l18n);
      expect(durationString.durationNumber, 6);
      expect(durationString.durationText, "biannual");
      expect(durationString.durationTextNumber, "6 months");
      expect(durationString.durationType, "month");
    });
    test('test iso 8601 P1Y', (){
      final DurationStrings durationString = "P1Y".fromIso8601(l18n);
      expect(durationString.durationNumber, 1);
      expect(durationString.durationText, "yearly");
      expect(durationString.durationTextNumber, "1 year");
      expect(durationString.durationType, "year");
    });
    test('test iso 8601 P2Y', (){
      final DurationStrings durationString = "P2Y".fromIso8601(l18n);
      expect(durationString.durationNumber, 2);
      expect(durationString.durationText, "yearly");
      expect(durationString.durationTextNumber, "2 years");
      expect(durationString.durationType, "year");
    });
  });
}