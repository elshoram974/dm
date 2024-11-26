import 'package:get/get.dart';

import '../../../features/home/data/datasources/orders_remote_data_source.dart';
import '../../../features/home/data/repositories/orders_repo_imp.dart';
import '../../../features/home/domain/repositories/orders_repo.dart';
import '../../../features/home/presentation/controller/orders_controller.dart';
import '../services/api_services.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OrdersRemoteDataSource>(
      OrdersRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<OrdersRepositories>(
      OrdersRepositoriesImp(Get.find<OrdersRemoteDataSource>()),
    );

    Get.put<OrdersController>(
      OrdersControllerImp(repo: Get.find<OrdersRepositories>()),
    );
  }
}
