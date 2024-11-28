import 'package:get/get.dart';

import '../../../features/home/data/datasources/home_local_data_source.dart';
import '../../../features/home/data/datasources/home_remote_data_source.dart';
import '../../../features/home/data/repositories/home_repo_imp.dart';
import '../../../features/home/domain/repositories/home_repo.dart';
import '../../../features/home/presentation/controller/home_controller.dart';
import '../../../features/login/data/datasources/auth_local_data_source.dart';
import '../services/api_services.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRemoteDataSource>(
      HomeRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<HomeLocalDataSource>(
      HomeLocalDataSourceImp(Get.find()),
    );
    Get.put<HomeRepositories>(
      HomeRepositoriesImp(
        localDataSource: Get.find<HomeLocalDataSource>(),
        remoteDataSource: Get.find<HomeRemoteDataSource>(),
        authLocalDataSource: Get.find<AuthLocalDataSource>(),
      ),
    );

    Get.put<HomeController>(
      HomeControllerImp(
        repo: Get.find<HomeRepositories>(),
        user: Get.find<AuthLocalDataSource>().getCurrentUser(),
      ),
    );
  }
}
