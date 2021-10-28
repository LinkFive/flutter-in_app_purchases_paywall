# Example

## Import

```dart
import 'package:in_app_purchases_intl/in_app_purchases_intl.dart';
```

## MaterialApp as localizationsDelegates

```
MaterialApp(
  // ...
  localizationsDelegates: [
    PaywallLocalizations.delegate,
    // ...
  ],
  // ...
);
```

## Get your Strings

```
PaywallLocalizations.of(context)!.weekly
PaywallLocalizations.of(context)!.nweek(4)
```

Or **be confident** and use our helper class to use en as the fallback when the language is not
supported.

```
PaywallL10NHelper.of(context).weekly
PaywallL10NHelper.of(context).nweek(4)
```