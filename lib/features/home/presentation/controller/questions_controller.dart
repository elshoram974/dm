import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';

import '../../data/models/question_model.dart';
import '../../domain/repositories/questions_repo.dart';

abstract class QuestionsController extends GetxController {
  QuestionsController({required this.repo});
  final QuestionsRepositories repo;
  Status? getQuestionsStatus;

  List<QuestionModel> _questions = [];
  List<QuestionModel> get questions => _questions;

  Future<void> getQuestions();
}

class QuestionsControllerImp extends QuestionsController {
  QuestionsControllerImp({required super.repo}) {
    // _customerId = Get.arguments;
    getQuestions();
  }

  // late String _customerId;

  @override
  Future<void> getQuestions() async {
    getQuestionsStatus = const Loading();
    update();

    await handleResponseInController<List<QuestionModel>>(
      status: await repo.getQuestions(),
      onSuccess: (data) => _questions = data,
    );
    getQuestionsStatus = null;
    update();
  }
}
