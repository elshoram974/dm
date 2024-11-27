import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/num_ex.dart';
import 'package:shora/core/utils/extensions/responsive_ex.dart';

import '../../../data/models/question_model.dart';
import 'answer_widgets/check_box_answer_widget.dart';

class QuestionCardWidget extends StatelessWidget {
  const QuestionCardWidget({
    super.key,
    required this.question,
    required this.index,
  });
  final QuestionModel question;
  final int index;

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
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: context.isPhoneWidth
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: AppConst.smallPadding,
                  mainAxisSpacing: AppConst.extraSmallPadding,
                )
              : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3.5,
                  crossAxisSpacing: AppConst.smallPadding,
                  mainAxisSpacing: AppConst.extraSmallPadding,
                ),
          children: [
            if (question.ansA != null)
              CheckBoxAnswerWidget(
                question.ansA!,
                isSelected: true,
              ),
            if (question.ansB != null) CheckBoxAnswerWidget(question.ansB!),
            if (question.ansC != null) CheckBoxAnswerWidget(question.ansC!),
            if (question.ansD != null) CheckBoxAnswerWidget(question.ansD!),
          ],
        ),
      ],
    );
  }
}
