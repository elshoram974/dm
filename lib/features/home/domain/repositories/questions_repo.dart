import 'package:shora/core/status/status.dart';

import '../../data/models/question_model.dart';

abstract class QuestionsRepositories {
  const QuestionsRepositories();

  Future<Status<List<QuestionModel>>> getQuestions();
}
