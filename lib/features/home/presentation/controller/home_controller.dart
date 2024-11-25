import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/functions/show_my_snack_bar.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

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

  int page = 1;
  int totalCustomers = -1;

  ScrollController scrollController = ScrollController();

  Future<void> getCustomers(bool reload);

  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp({
    required super.user,
    required super.repo,
  }) {
    getCustomers(false);
    scrollController.addListener(_paginationFn);
  }

  @override
  void onClose() {
    scrollController.removeListener(_paginationFn);
    scrollController.dispose();
    super.onClose();
  }

  @override
  Future<void> getCustomers(bool reload) async {
    page = 1;

    if (!reload) {
      getCustomerStatus = const Loading();
      update();
    }

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(page),
      onSuccess: (data) {
        _customers = data.data;
        page = data.pagination.currentPage;
        totalCustomers = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  Future<void> _getPaginatedCustomers() async {
    getCustomerStatus = const Loading(true);
    update();

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(++page),
      onSuccess: (data) {
        _customers.addAll(data.data);
        page = data.pagination.currentPage;
        totalCustomers = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  void _paginationFn() {
    if (getCustomerStatus is! Loading &&
        customers.length < totalCustomers &&
        scrollController.offset >=
            0.9 * scrollController.position.maxScrollExtent) {
      _getPaginatedCustomers();
    }
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
