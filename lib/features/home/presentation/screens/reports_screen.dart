import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/filled_button.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/shared/select_date_range_widget.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/config/routes/routes.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/constants/app_strings.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/report_card_entity.dart';
import '../controller/reports_controller.dart';
import '../widgets/reports_widgets/report_data_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<ReportsController>().onPopInvoked(),
      child: Scaffold(
        appBar: customAppBar(context),
        body: GetBuilder<ReportsController>(
          builder: (controller) {
            return SafeArea(
              bottom: false,
              child: CustomScrollView(
                physics: controller.getReportStatus is Loading &&
                        (controller.getReportStatus as Loading).loadingMore
                    ? const NeverScrollableScrollPhysics()
                    : null,
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
                                  const ReportDataCardHeader(),
                                  if (controller.getReportStatus is Loading &&
                                      !(controller.getReportStatus as Loading)
                                          .loadingMore)
                                    ...List<Widget>.generate(
                                      10,
                                      (int i) => Skeletonizer(
                                        containersColor:
                                            context.theme.cardColor,
                                        child: ReportDataCard(
                                          reportData:
                                              ReportCardEntity.example(),
                                        ),
                                      ),
                                    )
                                  else ...[
                                    ...List<Widget>.generate(
                                      controller.reports.length,
                                      (int i) => ReportDataCard(
                                        reportData: controller.reports[i],
                                      ),
                                    )
                                  ],
                                ],
                              ),
                            ),
                          ),
                          if (controller.getReportStatus is Loading &&
                              (controller.getReportStatus as Loading)
                                  .loadingMore) ...[
                            const SizedBox(height: AppConst.defaultPadding),
                            const Center(child: CircularProgressIndicator()),
                          ],
                          const SizedBox(height: AppConst.defaultPadding),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  CustomAppBar customAppBar(BuildContext context) {
    final ReportsController controller = Get.find<ReportsController>();
    return CustomAppBar(
      title: S.of(context).reports,
      titleColor: context.theme.primaryColor,
      onPressBack: controller.onPopInvoked,
      bottom: MyResConstrainedBoxAlign(
        child: Row(
          children: [
            Expanded(
              child: GetBuilder<ReportsController>(
                builder: (_) {
                  return SelectDateRangeWidget(
                    initRange: controller.range,
                    onSelectRange: (range) {
                      controller.range = range;
                      controller.getReports(false);
                    },
                    onRemoveDateRange: () {
                      controller.range = null;
                      controller.getReports(false);
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: AppConst.smallPadding),
            CustomFilledButton(
              onPressed: () {
                final ReportsController controller =
                    Get.find<ReportsController>();
                Get.toNamed(
                  AppRoute.questions,
                  arguments: {AppString.customerId: controller.customerId},
                )?.then((value) {
                  if (value == true) controller.getReports(true);
                });
              },
              icon: const Icon(Icons.add),
              padding: EdgeInsets.zero,
              minimumSize: const Size(60, 45),
            ),
          ],
        ),
      ),
    );
  }
}
