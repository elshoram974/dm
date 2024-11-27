import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/filled_button.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/features/home/presentation/widgets/reports_widgets/report_data_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/question_model.dart';
import '../controller/questions_controller.dart';
import '../widgets/add_report_widgets/question_card_widget.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _questionsAppBar(context),
      extendBody: true,
      bottomNavigationBar: bottomBar(context),
      body: GetBuilder<QuestionsController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              if (controller.getQuestionsStatus is! Loading &&
                  controller.questions.isEmpty)
                const SliverFillRemaining(child: EmptyWidget())
              else
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
                              if (controller.getQuestionsStatus is Loading)
                                ...List<Widget>.generate(
                                  9,
                                  (int i) => Skeletonizer(
                                    containersColor: context.theme.cardColor,
                                    child: QuestionCardWidget(
                                      question: QuestionModel.allExample[i % 3],
                                      index: i,
                                    ),
                                  ),
                                )
                              else ...{
                                if (controller.isReportDetails)
                                  ...List<Widget>.generate(
                                    controller.questions.length,
                                    (int i) {
                                      return QuestionCardWidget(
                                        question: controller.questions[i],
                                        index: i,
                                      );
                                    },
                                  )
                                else
                                  ...List<Widget>.generate(
                                    controller.questions.length,
                                    (int i) {
                                      return QuestionCardWidget(
                                        question: controller.questions[i]
                                            .cancelAnswers(),
                                        index: i,
                                        onAnswer: (questionWithAnswer) {
                                          controller.updateQuestion(
                                            index: i,
                                            newQuestion: questionWithAnswer,
                                          );
                                        },
                                      );
                                    },
                                  ),
                              },
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

  Container? bottomBar(BuildContext context) {
    if (Get.find<QuestionsController>().isReportDetails) return null;
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
      ),
      child: MyResConstrainedBoxAlign(
        child: CustomFilledButton(
          text: S.of(context).save,
          minimumSize: const Size.fromHeight(50),
          onPressed: Get.find<QuestionsController>().sendNewReport,
        ),
      ),
    );
  }

  CustomAppBar _questionsAppBar(BuildContext context) {
    final QuestionsController controller = Get.find<QuestionsController>();
    if (controller.isReportDetails) {
      return CustomAppBar(
        title: S.of(context).reportDetails,
        titleColor: context.theme.primaryColor,
        bottom: Column(
          children: [
            ReportDataCard(
              reportData: controller.reportData!,
              openDetails: false,
            ),
            const Divider(height: 0, color: Colors.grey)
          ],
        ),
      );
    }
    return CustomAppBar(
      title: S.of(context).addReport,
      titleColor: context.theme.primaryColor,
    );
  }
}
