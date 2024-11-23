import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/login/data/datasources/auth_local_data_source.dart';
import '../../../../features/login/presentation/screens/login_screen.dart';
import '../../../../features/on_boarding/presentation/screens/on_boarding_screen.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../middleware/login_middleware.dart';
import '../../middleware/middleware.dart';

abstract final class AppRoute {
  const AppRoute();

  static String? currentScreen;

  static const String onBoarding = "/on-boarding";
  static const String login = "/login";
  static const String home = "/home";

  static List<GetPage> get pages => [
        GetPage(
          name: onBoarding,
          page: () => const OnBoardingScreen(),
          middlewares: [
            InitMiddleWare(
              prefs: Get.find<SharedPreferences>(),
              authLocal: Get.find<AuthLocalDataSource>(),
            ),
          ],
        ),
        GetPage(
          name: login,
          page: () => const LoginScreen(),
          binding: LoginBindings(),
          middlewares: [LoginMiddleWare(Get.find<AuthLocalDataSource>())],
        ),
        GetPage(
          name: home,
          page: () => const HomeScreen(),
          binding: HomeBindings(),
        ),
      ];
}
