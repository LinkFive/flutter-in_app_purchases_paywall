# A Collection of common Paywall Strings

This Project is a common translation package for the package [intl](https://pub.dev/packages/intl)

This a community project, please submit your strings and translations! :-)

## Why?
A paywall usually looks similar to others and the strings and translations are also the same. 


## Current Locales
* de
* en

## Usage

Add PaywallLocalizations for your intl flutter delegate localizations

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

Get your Strings with:
```
PaywallLocalizations.of(context)!.weekly
PaywallLocalizations.of(context)!.nweek(4)
```

Or **be confident** and use our helper class to avoid handling null-safety.

```
PaywallL10NHelper.of(context).weekly
PaywallL10NHelper.of(context).nweek(4)
```

## String Extensions

### Capitalize a String Extension

```
/// E.g. "hello world" will become "Hello world"
"hello world".toCapitalized()
```

### Title Case a String Extension

```
/// E.g. "hello world" will become "Hello World"
"hello world".toTitleCase()
```