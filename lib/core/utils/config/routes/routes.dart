import 'package:get/get.dart';

import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/home/presentation/screens/orders_screen.dart';
import '../../../../features/home/presentation/screens/reports_screen.dart';
import '../../../../features/login/data/datasources/auth_local_data_source.dart';
import '../../../../features/login/presentation/screens/login_screen.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/orders_bindings.dart';
import '../../bindings/reports_bindings.dart';
import '../../middleware/login_middleware.dart';

abstract final class AppRoute {
  const AppRoute();

  static String? currentScreen;

  static const String login = "/login";
  static const String home = "/home";
  static const String reports = "/reports";
  static const String orders = "/orders";

  static List<GetPage> get pages => [
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
        GetPage(
          name: reports,
          page: () => const ReportsScreen(),
          binding: ReportsBindings(),
        ),
        GetPage(
          name: orders,
          page: () => const OrdersScreen(),
          binding: OrdersBindings(),
        ),
      ];
}
