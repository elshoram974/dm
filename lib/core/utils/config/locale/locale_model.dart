import 'package:flutter/material.dart';

class LocaleModel {
  final String languageName;
  final String languageCode;
  final String countryCode;
  final String? imagePath;

  const LocaleModel({
    required this.languageName,
    required this.languageCode,
    required this.countryCode,
    this.imagePath,
  });

  Locale get locale => Locale(languageCode);
}
