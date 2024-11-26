import 'package:get/get.dart';

class AddReportBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<ReportsRemoteDataSource>(
    //   ReportsRemoteDataSourceImp(Get.find<APIServices>()),
    // );

    // Get.put<ReportsRepositories>(
    //   ReportsRepositoriesImp(Get.find<ReportsRemoteDataSource>()),
    // );

    // Get.put<ReportsController>(
    //   ReportsControllerImp(repo: Get.find<ReportsRepositories>()),
    // );
  }
}
