import 'package:flutter/material.dart';

/// Basic IconData And Text Model
///
/// Used for Bullet points
class IconAndText {
  final IconData icon;
  final String text;

  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal) in
  /// your roots Theme
  const IconAndText(this.icon, this.text);
}
