import 'package:get/get.dart';

class ReportsBindings extends Bindings {
  @override
  void dependencies() {
    print(Get.arguments);
    // Get.put<HomeRemoteDataSource>(
    //   HomeRemoteDataSourceImp(Get.find<APIServices>()),
    // );
    // Get.put<HomeLocalDataSource>(
    //   HomeLocalDataSourceImp(Get.find()),
    // );
    // Get.put<HomeRepositories>(
    //   HomeRepositoriesImp(
    //     localDataSource: Get.find<HomeLocalDataSource>(),
    //     remoteDataSource: Get.find<HomeRemoteDataSource>(),
    //   ),
    // );

    // Get.put<HomeController>(
    //   HomeControllerImp(
    //     repo: Get.find<HomeRepositories>(),
    //     user: Get.find<AuthLocalDataSource>().getCurrentUser(),
    //   ),
    // );
  }
}
