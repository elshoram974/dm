import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/config/routes/routes.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/functions/show_my_snack_bar.dart';
import 'package:shora/core/utils/helper/network_helper.dart';

import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repositories.dart';

abstract class LoginController extends GetxController {
  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneNumber? phone;
  String password = '';

  Future<void> login();

  void onPopInvoked();
}

class LoginControllerImp extends LoginController {
  LoginControllerImp(this.repo);
  final AuthRepositories repo;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> login() async {
    if (NetworkInfo.showSnackBarWhenNoInternet) return;

    if (!formKey.currentState!.validate()) return;
    _isLoading = true;
    update();
    final Status<UserModel> loginState = await repo.login(
      phone: phone!.phoneNumber!,
      password: password,
    );
    handleResponseInController<UserModel>(
      status: loginState,
      onSuccess: (data) {
        TextInput.finishAutofillContext();
        Get.offAllNamed(AppRoute.home);
      },
    );

    _isLoading = false;
    update();
  }

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if ((phone?.parseNumber().trim() ?? '').isNotEmpty || password.isNotEmpty) {
      if (DateTime.now().difference(_back) < const Duration(seconds: 2)) {
        exit(0);
      }
      ShowMySnackBar.call(
        S.current.pressAgainToExit,
        duration: const Duration(seconds: 2),
      );
      _back = DateTime.now();

      return;
    }
  }
}
