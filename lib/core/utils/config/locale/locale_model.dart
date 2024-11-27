import 'package:flutter/material.dart';

class LocaleModel {
  const LocaleModel({
    required this.languageName,
    required this.languageCode,
    this.countryCode,
    this.imagePath,
  });
  final String languageName;
  final String languageCode;
  final String? countryCode;
  final String? imagePath;

  Locale get locale => Locale(languageCode, countryCode);
}
