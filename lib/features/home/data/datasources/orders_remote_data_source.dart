import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';
import 'package:shora/core/utils/services/api_services.dart';

import '../../domain/entity/order_card_entity.dart';
import '../models/orders_list_model_per_customer/orders_model.dart';

abstract class OrdersRemoteDataSource {
  const OrdersRemoteDataSource();
  Future<PaginatedData<List<OrderCardEntity>>> getOrders(
    int page,
    String customerId,
  );
}

class OrdersRemoteDataSourceImp extends OrdersRemoteDataSource {
  const OrdersRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<PaginatedData<List<OrderCardEntity>>> getOrders(
    int page,
    String customerId,
  ) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.getOrders}/$customerId?page=$page",
    );
    final List<OrderCardEntity> orders = List.empty(growable: true);
    for (final Map<String, dynamic> d in res['data']) {
      orders.add(OrdersModel.fromMap(d));
    }

    return PaginatedData<List<OrderCardEntity>>(
      pagination: PaginationModel.fromMap(res),
      data: orders,
    );
  }
}
