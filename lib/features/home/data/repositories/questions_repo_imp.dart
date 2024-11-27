import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';

import '../../domain/repositories/questions_repo.dart';
import '../datasources/questions_remote_data_source.dart';
import '../models/question_model.dart';

class QuestionsRepositoriesImp extends QuestionsRepositories {
  const QuestionsRepositoriesImp(this.remoteDataSource);
  final QuestionsRemoteDataSource remoteDataSource;

  @override
  Future<Status<List<QuestionModel>>> getQuestions() {
    return executeAndHandleErrors<List<QuestionModel>>(
      () => remoteDataSource.getQuestions(),
    );
  }

  @override
  Future<Status<void>> addReport(
    int customerId,
    List<QuestionModel> questionsWithAnswers,
  ) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.addReport(customerId, questionsWithAnswers),
    );
  }
}
