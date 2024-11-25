import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/services/api_services.dart';
import 'package:shora/features/home/data/models/customer_model.dart';

import '../../domain/entity/customer_card_entity.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<List<CustomerCardEntity>> getCustomers();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  const HomeRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<List<CustomerCardEntity>> getCustomers() async {
    final Map<String, dynamic> res =
        await apiServices.get(AppLinks.getCustomers);
    final List<CustomerCardEntity> customers = List.empty(growable: true);
    for (final Map<String, dynamic> d in res['data']) {
      customers.add(CustomerModel.fromMap(d));
    }

    return customers;
  }
}
