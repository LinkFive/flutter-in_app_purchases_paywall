import 'package:intl/intl.dart' as intl;
import 'paywall_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class PaywallLocalizationsEs extends PaywallLocalizations {
  PaywallLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get weekly => 'semanal';

  @override
  String get monthly => 'mensualmente';

  @override
  String get quarterly => 'trimestral';

  @override
  String get biannual => 'bianual';

  @override
  String get yearly => 'anualmente';

  @override
  String get year => 'año';

  @override
  String nyear(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 año',
      other: '$count años',
    );
  }

  @override
  String get month => 'mes';

  @override
  String nmonth(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 mes',
      other: '$count meses',
    );
  }

  @override
  String get week => 'semana';

  @override
  String nweek(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 semana',
      other: '$count semanas',
    );
  }

  @override
  String get day => 'día';

  @override
  String nday(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '1 día',
      other: '$count días',
    );
  }

  @override
  String get continue_button => 'continuar';

  @override
  String get most_popular => 'Más populares';

  @override
  String get restore_purchase => 'Restaurar la compra';
}
