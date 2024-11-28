import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import '../../domain/entity/order_card_entity.dart';
import '../../domain/repositories/orders_repo.dart';

abstract class OrdersController extends GetxController {
  OrdersController({required this.repo});
  final OrdersRepositories repo;
  Status? getOrderStatus;
  DateTimeRange? range;

  List<OrderCardEntity> _orders = [];
  List<OrderCardEntity> get orders => _orders;

  int page = 1;
  int totalOrders = -1;

  ScrollController scrollController = ScrollController();

  Future<void> getOrders(bool reload);

  void onPopInvoked();
}

class OrdersControllerImp extends OrdersController {
  OrdersControllerImp({required super.repo}) {
    _customerId = Get.arguments;
    getOrders(false);
    scrollController.addListener(_paginationFn);
  }

  late String _customerId;

  @override
  void onClose() {
    scrollController.removeListener(_paginationFn);
    scrollController.dispose();
    super.onClose();
  }

  @override
  Future<void> getOrders(bool reload) async {
    page = 1;

    if (!reload) {
      getOrderStatus = const Loading();
      update();
    }

    await handleResponseInController<PaginatedData<List<OrderCardEntity>>>(
      status: await repo.getOrders(page, _customerId, range),
      onSuccess: (data) {
        _orders = data.data;
        page = data.pagination.currentPage;
        totalOrders = data.pagination.total;
      },
    );
    getOrderStatus = null;
    update();
  }

  Future<void> _getPaginatedOrders() async {
    getOrderStatus = const Loading(true);
    update();

    await handleResponseInController<PaginatedData<List<OrderCardEntity>>>(
      status: await repo.getOrders(++page, _customerId, range),
      onSuccess: (data) {
        _orders.addAll(data.data);
        page = data.pagination.currentPage;
        totalOrders = data.pagination.total;
      },
    );
    getOrderStatus = null;
    update();
  }

  void _paginationFn() {
    if (getOrderStatus is! Loading &&
        orders.length < totalOrders &&
        scrollController.offset >=
            0.9 * scrollController.position.maxScrollExtent) {
      _getPaginatedOrders();
    }
  }

  @override
  void onPopInvoked() {
    if (range == null) return Get.back();
    range = null;
    getOrders(false);
    update();
  }
}
