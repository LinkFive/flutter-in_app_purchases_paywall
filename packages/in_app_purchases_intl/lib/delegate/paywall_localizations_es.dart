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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count años',
      one: '1 año',
    );
    return '$_temp0';
  }

  @override
  String get month => 'mes';

  @override
  String nmonth(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meses',
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String get week => 'semana';

  @override
  String nweek(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count semanas',
      one: '1 semana',
    );
    return '$_temp0';
  }

  @override
  String get day => 'día';

  @override
  String nday(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get continue_button => 'continuar';

  @override
  String get most_popular => 'Más populares';

  @override
  String get restore_purchase => 'Restaurar la compra';

  @override
  String get manage_subscriptions_title => 'Gestionar las suscripciones';

  @override
  String get manage_subscription_google_play_title => 'Gestionar las suscripciones en Google Play';

  @override
  String get manage_subscription_google_play_button => 'Suscripciones a Google Play';

  @override
  String manage_subscription_productId(String productId) {
    return 'Gestionar $productId';
  }

  @override
  String get manage_subscription_apple_appstore_title => 'Gestione sus suscripciones en la App Store';

  @override
  String get manage_subscription_apple_appstore_button => 'Ir a la página de suscripciones';

  @override
  String get subscription_options_title => 'Opciones de suscripción';

  @override
  String get premium => 'Premium';

  @override
  String get app_bar_default_title => 'Go Premium';
}
