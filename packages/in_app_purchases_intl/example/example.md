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

Or **be confident** and use our helper class to avoid handling null-safety.

```
PaywallL10NHelper.of(context).weekly
PaywallL10NHelper.of(context).nweek(4)
```