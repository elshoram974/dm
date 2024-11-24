import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';

import 'package:shora/features/home/domain/entity/customer_card_entity.dart';

import '../../domain/repositories/home_repo.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoriesImp extends HomeRepositories {
  const HomeRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Status<List<CustomerCardEntity>>> getCustomers() {
    return executeAndHandleErrors<List<CustomerCardEntity>>(
      remoteDataSource.getCustomers,
    );
  }
}
