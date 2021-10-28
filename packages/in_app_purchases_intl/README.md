# A Collection of common Paywall Strings

This Project is a common translation package for the package [intl](https://pub.dev/packages/intl)

This a community project, please submit your strings and translations! :-)

## Why?
A paywall usually looks similar to others and the strings and translations are also the same. 


## Current Locales
* de
* en
* es

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

Or **be confident** and use our helper class to use en as the fallback when the language is not
supported.

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

## How to contribute

* Check out the project
* Open the file lib > l10n > paywall_en.arb
* Copy it with the language you would like to translate. e.g. paywall_es.arb
* Run flutter pub get packages (this will generate the dart files)
* Check out the folder: .dart_tool > flutter_gen > gen_l10n
* Inside you will find your generated language (if you don't see it, delete the .dart_tool folder and run the command again)
* Copy all files to lib > delegate. 
* Done! Commit, create a pull request, the community will definitely thank you! 
