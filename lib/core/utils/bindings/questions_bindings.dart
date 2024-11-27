import 'package:get/get.dart';

import '../../../features/home/data/datasources/questions_remote_data_source.dart';
import '../../../features/home/data/repositories/questions_repo_imp.dart';
import '../../../features/home/domain/repositories/questions_repo.dart';
import '../../../features/home/presentation/controller/questions_controller.dart';
import '../services/api_services.dart';

class QuestionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<QuestionsRemoteDataSource>(
      QuestionsRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<QuestionsRepositories>(
      QuestionsRepositoriesImp(Get.find<QuestionsRemoteDataSource>()),
    );

    Get.put<QuestionsController>(
      QuestionsControllerImp(repo: Get.find<QuestionsRepositories>()),
    );
  }
}
