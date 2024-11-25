import 'package:flutter/foundation.dart' show kDebugMode;

import 'core/utils/config/locale/locale_model.dart';
import 'core/utils/constants/app_assets.dart';

abstract final class AppInfo {
  const AppInfo();

  static const String baseURL = "https://omegacuremart.com";

  static const String appName = "shora";
  static const String appId = "com.shora.shora";
  static const String appVersion = "1.0.0";
  static const int appBuildVersion = 1;

  /// country code like in locale to make initialize in phone fields
  static const String initCountryIsoCode = 'EG';

  // static const bool isDebugMode = false;
  static const bool isDebugMode = kDebugMode;

  /// * To add locale .. You have to add it in package(flutter intel)
  /// and add text in its file .arb and don't forget to add it in info.plist file
  static const List<LocaleModel> supportedLocales = [
    LocaleModel(
      languageCode: "ar",
      countryCode: "EG",
      languageName: "العربية",
      imagePath: AppAssets.arabic,
    ),
    LocaleModel(
      languageCode: "en",
      countryCode: "US",
      languageName: "English",
      imagePath: AppAssets.english,
    ),
  ];

  // static const String appIcon = AppAssets.appIcon;
  // static const String splashIcon = AppAssets.splashIcon;
  // static const String splashAndroid12 = AppAssets.splashAndroid12;
}
