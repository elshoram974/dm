import 'dart:io';

import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/functions/show_my_snack_bar.dart';

import '../../../login/data/models/user_model.dart';
import '../../domain/entity/customer_card_entity.dart';
import '../../domain/repositories/home_repo.dart';

abstract class HomeController extends GetxController {
  HomeController({required this.repo, required this.user});
  UserModel? user;
  final HomeRepositories repo;
  Status? getCustomerStatus;

  List<CustomerCardEntity> _customers = [];
  List<CustomerCardEntity> get customers => _customers;

  Future<void> getCustomers(bool reload);

  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp({
    required super.user,
    required super.repo,
  }) {
    getCustomers(false);
  }

  Future<void> getCustomers(bool reload) async {
    if (!reload) {
      getCustomerStatus = const Loading();
      update();
    }

    await handleResponseInController<List<CustomerCardEntity>>(
      status: await repo.getCustomers(),
      onSuccess: (data) => _customers = data,
    );
    getCustomerStatus = null;
    update();
  }

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
