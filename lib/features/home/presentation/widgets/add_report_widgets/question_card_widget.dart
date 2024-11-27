import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/num_ex.dart';

import '../../../data/models/question_model.dart';
import 'answer_widgets/selected_answers_grid.dart';
import 'answer_widgets/text_answer_widget.dart';

class QuestionCardWidget extends StatelessWidget {
  const QuestionCardWidget({
    super.key,
    required this.question,
    required this.index,
    this.onAnswer,
  });
  final QuestionModel question;
  final int index;
  final void Function(QuestionModel)? onAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index != 0)
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            height: AppConst.bigPadding,
          ),
        Text(
          S.of(context).questionNo((index + 1).locale),
          style: context.textTheme.titleSmall,
        ),
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(top: AppConst.smallPadding),
          padding: const EdgeInsets.all(AppConst.smallPadding),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
          child: Text(
            question.question,
            style: context.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppConst.smallPadding),
        if (question.type != QuestionType.short)
          SelectedAnswersGrid(question: question, onChanged: onAnswer)
        else
          TextAnswerWidget(question: question, onChanged: onAnswer),
      ],
    );
  }
}
