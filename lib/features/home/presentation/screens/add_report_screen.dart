import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

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