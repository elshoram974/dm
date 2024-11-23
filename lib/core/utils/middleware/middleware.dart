import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/login/data/datasources/auth_local_data_source.dart';
import '../config/routes/routes.dart';
import '../constants/app_strings.dart';

class InitMiddleWare extends GetMiddleware {
  InitMiddleWare({required this.prefs, required this.authLocal});
  final SharedPreferences prefs;
  final AuthLocalDataSource authLocal;
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authLocal.getCurrentUser() != null) {
      return const RouteSettings(name: AppRoute.home);
    } else if (prefs.containsKey(AppString.kLocaleCode)) {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
