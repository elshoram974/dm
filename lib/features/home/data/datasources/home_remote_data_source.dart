import 'package:shora/core/utils/services/api_services.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  const HomeRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;
}
