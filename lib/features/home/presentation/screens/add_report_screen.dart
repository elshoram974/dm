import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/question_model.dart';
import '../controller/reports_controller.dart';
import '../widgets/add_report_widgets/question_card_widget.dart';

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
              if (controller.getReportStatus is! Loading &&
                  controller.reports.isEmpty)
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
                              if (controller.getReportStatus is Loading)
                                ...List<Widget>.generate(
                                  12,
                                  (int i) => Skeletonizer(
                                    containersColor: context.theme.cardColor,
                                    child: QuestionCardWidget(
                                      question: QuestionModel.allExample[i % 3],
                                      index: i,
                                    ),
                                  ),
                                )
                              else
                                ...List<Widget>.generate(
                                  12,
                                  (int i) {
                                    final QuestionModel question = QuestionModel
                                        .allExample[i % 3]
                                        .cancelAnswers();
                                    return QuestionCardWidget(
                                      question: question,
                                      index: i,
                                      onAnswer: (questionWithAnswer) {
                                        print(questionWithAnswer);
                                      },
                                    );
                                  },
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
