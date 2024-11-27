import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shora/app_info.dart';

import '../../constants/app_strings.dart';
import '../locale/generated/l10n.dart';
import '../locale/locale_model.dart';

abstract class ConfigController extends GetxController {
  ConfigController(this.prefs);
  final SharedPreferences prefs;

  Locale get locale;
  void changeLocale(Locale newLocale);
}

class ConfigControllerImp extends ConfigController {
  ConfigControllerImp(super.prefs) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness
          .dark, //Get.isDarkMode ? Brightness.light : Brightness.dark,
    ));
  }

  late Locale _locale = prefs.containsKey(AppString.kLocaleCode)
      ? _currentLocal(prefs.getString(AppString.kLocaleCode)!)
      : Get.deviceLocale != null
          ? _currentLocal(Get.deviceLocale!.languageCode)
          : AppInfo.supportedLocales.first.locale;

  Locale _currentLocal(String langCode) {
    final LocaleModel lang = AppInfo.supportedLocales
            .where((e) => e.languageCode == langCode)
            .firstOrNull ??
        AppInfo.supportedLocales.first;
    final Locale locale = Locale(lang.languageCode, lang.countryCode);
    if (S.delegate.isSupported(locale)) return locale;

    return S.delegate.supportedLocales.first;
  }

  @override
  Locale get locale => Locale(_locale.languageCode);

  @override
  void changeLocale(Locale newLocale) {
    if (newLocale.languageCode == _locale.languageCode) return;
    _locale = _currentLocal(newLocale.languageCode);
    S.load(newLocale);
    Get.updateLocale(newLocale);
    prefs.setString(AppString.kLocaleCode, _locale.languageCode);
  }
}
