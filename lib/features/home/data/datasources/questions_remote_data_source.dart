import 'dart:convert';

import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/services/api_services.dart';

import '../models/question_model.dart';

abstract class QuestionsRemoteDataSource {
  const QuestionsRemoteDataSource();
  Future<List<QuestionModel>> getQuestions();
  Future<void> addReport(
    int customerId,
    List<QuestionModel> questionsWithAnswers,
  );
}

class QuestionsRemoteDataSourceImp extends QuestionsRemoteDataSource {
  const QuestionsRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final Map<String, dynamic> res =
        await apiServices.get(AppLinks.getQuestions);
    final List<QuestionModel> questions = List.empty(growable: true);
    for (Map<String, dynamic> e in res['data']) {
      questions.add(QuestionModel.fromMap(e));
    }
    return questions;
  }

  @override
  Future<void> addReport(
    int customerId,
    List<QuestionModel> questionsWithAnswers,
  ) {
    final Map<String, dynamic> data = {
      'customer_id': customerId,
      'data': questionsWithAnswers.map((q) => q.toMap()).toList(),
    };
    return apiServices.post(
      AppLinks.addReports,
      jsonEncode(data),
    );
  }
}
