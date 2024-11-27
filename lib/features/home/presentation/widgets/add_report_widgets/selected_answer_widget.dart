import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../../../data/models/question_model.dart';

class SelectedAnswerWidget extends StatelessWidget {
  const SelectedAnswerWidget(this.answer, {super.key, required this.type});
  final String answer;
  final QuestionType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppConst.smallPadding),
      decoration: BoxDecoration(
        color: context.theme.cardColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
      child: Text(
        answer,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
