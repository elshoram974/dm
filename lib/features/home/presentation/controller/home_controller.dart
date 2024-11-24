import 'dart:io';

import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/functions/show_my_snack_bar.dart';

import '../../../login/data/models/user_model.dart';

abstract class HomeController extends GetxController {
  UserModel? user;
  HomeController({
    required this.user,
  });
  bool isLoading = false;

  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp({
    required super.user,
  });

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if (DateTime.now().difference(_back) < const Duration(seconds: 2)) {
      exit(0);
    }
    ShowMySnackBar.call(
      S.current.pressAgainToExit,
      duration: const Duration(seconds: 2),
    );
    _back = DateTime.now();
  }
}
