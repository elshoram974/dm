import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import 'package:shora/features/home/domain/entity/customer_card_entity.dart';
import 'package:shora/features/login/data/datasources/auth_local_data_source.dart';

import '../../domain/repositories/home_repo.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoriesImp extends HomeRepositories {
  const HomeRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.authLocalDataSource,
  });
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Future<Status<PaginatedData<List<CustomerCardEntity>>>> getCustomers(
    int page, [
    String? query,
  ]) {
    return executeAndHandleErrors<PaginatedData<List<CustomerCardEntity>>>(
      () => remoteDataSource.getCustomers(page, query),
    );
  }

  @override
  Future<Status<void>> logout() {
    return executeAndHandleErrors<void>(() => authLocalDataSource.logOut());
  }
}
