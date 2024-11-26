import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../../data/models/question_model.dart';
import '../controller/reports_controller.dart';

class AddReportScreen extends StatelessWidget {
  const AddReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).addReport,
        titleColor: context.theme.primaryColor,
      ),
      body: GetBuilder<ReportsController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              // if (controller.getReportStatus is! Loading &&
              //     controller.reports.isEmpty)
              //   const SliverFillRemaining(child: EmptyWidget())
              // else
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: AppConst.smallPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConst.defaultPadding,
                      ),
                      child: MyResConstrainedBoxAlign(
                        child: Column(
                          children: [
                            ...List<Widget>.generate(
                              5,
                              (int i) => QuestionCardWidget(
                                question: QuestionModel.example(),
                                index: i,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConst.defaultPadding),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
        if (index != 0) const Divider(color: Colors.grey, thickness: 0.5),
        Text(
          S.of(context).questionNo(index + 1),
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: AppConst.smallPadding,
            mainAxisSpacing: AppConst.extraSmallPadding,
          ),
          children: [
            if (question.ansA != null) AnswerCardWidget(question.ansA!),
            if (question.ansB != null) AnswerCardWidget(question.ansB!),
            if (question.ansC != null) AnswerCardWidget(question.ansC!),
            if (question.ansD != null) AnswerCardWidget(question.ansD!),
          ],
        ),
      ],
    );
  }
}

class AnswerCardWidget extends StatelessWidget {
  const AnswerCardWidget(this.answer, {super.key});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
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
      ),
    );
  }
}
