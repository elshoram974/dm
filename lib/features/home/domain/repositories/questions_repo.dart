import 'package:shora/core/status/status.dart';

import '../../data/models/question_model.dart';

abstract class QuestionsRepositories {
  const QuestionsRepositories();

  Future<Status<List<QuestionModel>>> getQuestions();
  Future<Status<List<QuestionModel>>> getReportDetails(int id);
  Future<Status<void>> addReport(
    int customerId,
    List<QuestionModel> questionsWithAnswers,
  );
}
