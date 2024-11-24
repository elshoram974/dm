import 'package:shora/core/utils/services/api_services.dart';

import '../../domain/entity/customer_card_entity.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<List<CustomerCardEntity>> getCustomers();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  const HomeRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;
  
  @override
  Future<List<CustomerCardEntity>> getCustomers() {
    throw UnimplementedError();
  }
}
