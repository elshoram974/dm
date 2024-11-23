import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_strings.dart';
import '../locale/generated/l10n.dart';

abstract class ConfigController extends GetxController {
  ConfigController(this.prefs);
  final SharedPreferences prefs;

  Locale get locale;
  void changeLocale(Locale newLocale);
}

class ConfigControllerImp extends ConfigController {
  ConfigControllerImp(super.prefs);

  late String _locale = prefs.getString(AppString.kLocaleCode) ??
      Get.deviceLocale?.languageCode ??
      'en';

  @override
  Locale get locale => Locale(_locale);

  @override
  void changeLocale(Locale newLocale) {
    if (newLocale.languageCode == _locale) return;
    _locale = newLocale.languageCode;
    S.load(newLocale);
    Get.updateLocale(newLocale);
    prefs.setString(AppString.kLocaleCode, _locale);
  }
}
