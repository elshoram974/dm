import 'package:get/get.dart';

import '../../../features/home/data/datasources/reports_remote_data_source.dart';
import '../../../features/home/data/repositories/reports_repo_imp.dart';
import '../../../features/home/domain/repositories/reports_repo.dart';
import '../../../features/home/presentation/controller/reports_controller.dart';
import '../services/api_services.dart';

class ReportsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportsRemoteDataSource>(
      ReportsRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<ReportsRepositories>(
      ReportsRepositoriesImp(Get.find<ReportsRemoteDataSource>()),
    );

    Get.put<ReportsController>(
      ReportsControllerImp(repo: Get.find<ReportsRepositories>()),
    );
  }
}
