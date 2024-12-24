import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_info.dart';
import 'core/utils/bindings/initial_bindings.dart';
import 'core/utils/config/controller/config_controller.dart';
import 'core/utils/config/locale/generated/l10n.dart';
import 'core/utils/config/routes/routes.dart';
import 'core/utils/config/theme/dark_theme.dart';
import 'core/utils/config/theme/light_theme.dart';
import 'core/utils/helper/network_helper.dart';

void main() async {
  if (AppInfo.isDebugMode) HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      NetworkInfo.init(),
      Hive.initFlutter(),
    ],
  );
  await InitialBindings.dependencies();
  runApp(
    DevicePreview(
      enabled: AppInfo.isDebugMode,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      useInheritedMediaQuery: AppInfo.isDebugMode,
      locale: Get.find<ConfigController>().locale,
      builder: DevicePreview.appBuilder,
      title: AppInfo.appName,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.login,
      debugShowCheckedModeBanner: AppInfo.isDebugMode, 
      // initialBinding: InitialBindings(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
