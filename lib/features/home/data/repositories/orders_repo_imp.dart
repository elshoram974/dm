import 'package:flutter/material.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import '../../domain/entity/order_card_entity.dart';
import '../../domain/repositories/orders_repo.dart';
import '../datasources/orders_remote_data_source.dart';

class OrdersRepositoriesImp extends OrdersRepositories {
  const OrdersRepositoriesImp(this.remoteDataSource);
  final OrdersRemoteDataSource remoteDataSource;

  @override
  Future<Status<PaginatedData<List<OrderCardEntity>>>> getOrders(
    int page,
    String customerId, [
    DateTimeRange? range,
  ]) {
    return executeAndHandleErrors<PaginatedData<List<OrderCardEntity>>>(
      () => remoteDataSource.getOrders(page, customerId, range),
    );
  }
}
