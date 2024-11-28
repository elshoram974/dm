import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/config/routes/routes.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
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
  final Debouncer debouncer = Debouncer(
    delay: const Duration(milliseconds: AppConst.debounceMilliseconds),
  );

  String? _query;
  bool get inSearch => _query != null;

  List<CustomerCardEntity> _searchedCustomers = [];
  List<CustomerCardEntity> _customers = [];

  List<CustomerCardEntity> get customers =>
      inSearch ? _searchedCustomers : _customers;

  int _page = 1;
  int _totalCustomers = -1;

  int _pageSearch = 1;
  int _totalCustomersSearch = -1;

  ScrollController scrollController = ScrollController();

  late TextEditingController textController;

  void changeQuerySearch(String? searchQuery);
  Future<void> getCustomers(bool reload);
  Future<void> getCustomersSearch(String query);

  Future<void> logOut();

  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp({
    required super.user,
    required super.repo,
  }) {
    getCustomers(false);
    scrollController.addListener(_paginationFn);
    textController = TextEditingController();
  }

  @override
  void onClose() {
    scrollController.removeListener(_paginationFn);
    scrollController.dispose();
    textController.dispose();
    super.onClose();
  }

  @override
  Future<void> getCustomers(bool reload) async {
    _page = 1;

    if (reload) {
      changeQuerySearch(null);
    } else {
      getCustomerStatus = const Loading();
      update();
    }

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(_page),
      onSuccess: (data) {
        _customers = data.data;
        _page = data.pagination.currentPage;
        _totalCustomers = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  Future<void> _getPaginatedCustomers() async {
    getCustomerStatus = const Loading(true);
    update();

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(++_page),
      onSuccess: (data) {
        _customers.addAll(data.data);

        _page = data.pagination.currentPage;
        _totalCustomers = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  @override
  Future<void> getCustomersSearch(String query) async {
    _query = query.trim();
    _pageSearch = 1;

    getCustomerStatus = const Loading();
    update();

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(_pageSearch, _query),
      onSuccess: (data) {
        _searchedCustomers = data.data;
        _pageSearch = data.pagination.currentPage;
        _totalCustomersSearch = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  Future<void> _getPaginatedCustomersSearch() async {
    getCustomerStatus = const Loading(true);
    update();

    await handleResponseInController<PaginatedData<List<CustomerCardEntity>>>(
      status: await repo.getCustomers(++_pageSearch, _query),
      onSuccess: (data) {
        _searchedCustomers.addAll(data.data);
        _pageSearch = data.pagination.currentPage;
        _totalCustomersSearch = data.pagination.total;
      },
    );
    getCustomerStatus = null;
    update();
  }

  void _paginationFn() {
    if (getCustomerStatus is! Loading &&
        scrollController.offset >=
            0.9 * scrollController.position.maxScrollExtent) {
      if (inSearch) {
        if (customers.length < _totalCustomersSearch) {
          _getPaginatedCustomersSearch();
        }
      } else {
        if (customers.length < _totalCustomers) _getPaginatedCustomers();
      }
    }
  }

  @override
  void changeQuerySearch(String? searchQuery) {
    _query = searchQuery;
    if (_query == null) {
      debouncer.cancel();
      _searchedCustomers = [];
      _pageSearch = 1;
      _totalCustomersSearch = -1;
      textController.clear();
    }
    update();
  }

  @override
  Future<void> logOut() async {
    handleResponseInController<void>(
      status: await repo.logout(),
      onSuccess: (_) => Get.offAllNamed(AppRoute.login),
    );
  }

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if (inSearch) return changeQuerySearch(null);

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
