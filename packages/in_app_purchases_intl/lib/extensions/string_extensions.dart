extension StringCasingExtension on String {

  /// Capitalize a String
  ///
  /// E.g. "hello world" will become "Hello world"
  String toCapitalized() => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';

  /// Title Case a String
  ///
  /// E.g. "hello world" will become "Hello World"
  String toTitleCase() => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.toCapitalized()).join(" ");
}