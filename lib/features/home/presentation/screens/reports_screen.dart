import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/customer_card_entity.dart';
import '../../domain/entity/report_card_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/customer_card_widget.dart';
import '../widgets/reports_widgets/report_data_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reportAppBar(context),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: controller.getCustomerStatus is Loading &&
                      (controller.getCustomerStatus as Loading).loadingMore
                  ? const NeverScrollableScrollPhysics()
                  : null,
              slivers: [
                if (controller.getCustomerStatus is! Loading &&
                    controller.customers.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(S.of(context).empty),
                    ),
                  )
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
                                if (controller.getCustomerStatus is Loading &&
                                    !(controller.getCustomerStatus as Loading)
                                        .loadingMore)
                                  ...List<Widget>.generate(
                                    10,
                                    (int i) => Skeletonizer(
                                      containersColor: context.theme.cardColor,
                                      child: ReportDataCard(
                                        reportData: ReportCardEntity.example(),
                                      ),
                                    ),
                                  )
                                else ...[
                                  ...List<Widget>.generate(
                                    10,
                                    (int i) => ReportDataCard(
                                      reportData: ReportCardEntity.example(),
                                    ),
                                  )
                                ],
                              ],
                            ),
                          ),
                        ),
                        if (controller.getCustomerStatus is Loading &&
                            !(controller.getCustomerStatus as Loading)
                                .loadingMore)
                          ...List<Widget>.generate(
                            10,
                            (int i) => Skeletonizer(
                              containersColor: context.theme.cardColor,
                              child: CustomerCardWidget(
                                entity: CustomerCardEntity.example(),
                              ),
                            ),
                          )
                        else
                          ...[],
                        if (controller.getCustomerStatus is Loading &&
                            (controller.getCustomerStatus as Loading)
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
    );
  }

  AppBar reportAppBar(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).reports),
      centerTitle: true,
      leadingWidth: 120,
      leading: Align(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          child: IconButton(
            onPressed: Get.back,
            icon: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(S.of(context).back),
              ],
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          child: MyDefaultField(
            hintText: S.of(context).selectDate,
            suffix: const Icon(
              Icons.calendar_month,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
