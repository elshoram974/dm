import 'package:get/get.dart';

import '../../../features/login/data/datasources/auth_local_data_source.dart';
import '../../../features/login/data/datasources/auth_remote_data_source.dart';
import '../../../features/login/data/repositories/auth_repositories_imp.dart';
import '../../../features/login/presentation/controller/login_controller.dart';
import '../services/api_services.dart';

class LoginBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<AuthRepositoriesImp>(
      AuthRepositoriesImp(
        localDataSource: Get.find<AuthLocalDataSource>(),
        remoteDataSource: Get.find<AuthRemoteDataSource>(),
      ),
    );
    Get.put<LoginController>(
      LoginControllerImp(Get.find<AuthRepositoriesImp>()),
    );
  }
}
