import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_strings.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/functions/show_my_dialog.dart';

import '../../data/models/question_model.dart';
import '../../domain/entity/report_card_entity.dart';
import '../../domain/repositories/questions_repo.dart';

abstract class QuestionsController extends GetxController {
  QuestionsController({required this.repo});
  final QuestionsRepositories repo;
  Status? getQuestionsStatus;

  List<QuestionModel> _questions = [];
  List<QuestionModel> get questions => _questions;

  ReportCardEntity? _reportData;
  ReportCardEntity? get reportData => _reportData;
  bool get isReportDetails => _reportData != null;

  Future<void> getQuestions();

  void updateQuestion({required int index, required QuestionModel newQuestion});

  Future<void> sendNewReport();
}

class QuestionsControllerImp extends QuestionsController {
  QuestionsControllerImp({required super.repo}) {
    _customerId = Get.arguments[AppString.customerId] as String;
    _reportData = Get.arguments[AppString.reportData] as ReportCardEntity?;
    if (isReportDetails) {
      print(_reportData);
    } else {
      getQuestions();
    }
  }

  late String _customerId;

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

  @override
  void updateQuestion({
    required int index,
    required QuestionModel newQuestion,
  }) {
    _questions[index] = newQuestion;
  }

  @override
  Future<void> sendNewReport() async {
    if (!_validateQuestions) {
      ShowMyDialog.error(Get.context!,
          body: S.current.pleaseAnswerAllQuestions);
      return;
    }
    ShowMyDialog.loading();
    await handleResponseInController<void>(
      status: await repo.addReport(int.parse(_customerId), _questions),
      onSuccess: (_) => Get.back(),
    );
    Get.back(result: true);
  }

  bool get _validateQuestions {
    for (QuestionModel e in _questions) {
      if (!e.isAnswered) return false;
    }

    return true;
  }
}
