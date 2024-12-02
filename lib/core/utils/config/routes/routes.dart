import 'package:get/get.dart';

import '../../../../features/home/presentation/screens/privacy_screen.dart';
import '../../../../features/home/presentation/screens/questions_screen.dart';
import '../../../../features/home/presentation/screens/home_screen.dart';
import '../../../../features/home/presentation/screens/orders_screen.dart';
import '../../../../features/home/presentation/screens/reports_screen.dart';
import '../../../../features/home/presentation/screens/terms_screen.dart';
import '../../../../features/login/data/datasources/auth_local_data_source.dart';
import '../../../../features/login/presentation/screens/login_screen.dart';
import '../../bindings/questions_bindings.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/orders_bindings.dart';
import '../../bindings/reports_bindings.dart';
import '../../middleware/login_middleware.dart';

abstract final class AppRoute {
  const AppRoute();

  static const String login = "/login";
  static const String home = "/home";
  static const String orders = "/orders";
  static const String reports = "/reports";
  static const String questions = "/questions";
  static const String privacy = "/privacy";
  static const String terms = "/terms";

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
          name: orders,
          page: () => const OrdersScreen(),
          binding: OrdersBindings(),
        ),
        GetPage(
          name: reports,
          page: () => const ReportsScreen(),
          binding: ReportsBindings(),
        ),
        GetPage(
          name: questions,
          page: () => const QuestionsScreen(),
          binding: QuestionsBindings(),
        ),
        GetPage(
          name: privacy,
          page: () => const PrivacyScreen(),
        ),
        GetPage(
          name: terms,
          page: () => const TermsScreen(),
        ),
      ];
}
