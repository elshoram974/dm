import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/constants/app_strings.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';
import 'package:shora/core/utils/services/api_services.dart';
import 'package:shora/features/home/data/models/customer_model.dart';

import '../../domain/entity/customer_card_entity.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<PaginatedData<List<CustomerCardEntity>>> getCustomers(
      int page, String? query);
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  const HomeRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<PaginatedData<List<CustomerCardEntity>>> getCustomers(
    int page,
    String? query,
  ) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.getCustomers}?page=$page&${AppString.search}=${query ?? ''}",
    );
    final List<CustomerCardEntity> customers = List.empty(growable: true);
    for (final Map<String, dynamic> d in res['data']['data']) {
      customers.add(CustomerModel.fromMap(d));
    }

    return PaginatedData<List<CustomerCardEntity>>(
      pagination: PaginationModel.fromMap(res['data']),
      data: customers,
    );
  }
}
