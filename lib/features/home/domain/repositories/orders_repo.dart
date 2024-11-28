import 'package:flutter/material.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import '../entity/order_card_entity.dart';

abstract class OrdersRepositories {
  const OrdersRepositories();

  Future<Status<PaginatedData<List<OrderCardEntity>>>> getOrders(
    int page,
    String customerId, [
    DateTimeRange? range,
  ]);
}
