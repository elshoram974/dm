import 'package:flutter/material.dart';

Color? stringToColor(String? hexColor) {
  hexColor = hexColor?.replaceAll("#", "").trim();
  if (hexColor == null || hexColor.length < 3) return null;

  for (int i = hexColor.length; i < 6; i++) hexColor = "F$hexColor";

  hexColor = "0xFF${hexColor.toString()}";

  final int? color = int.tryParse("$hexColor");
  if (color == null) return null;
  return Color(color);
}
