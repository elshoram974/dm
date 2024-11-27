import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/config/routes/routes.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/constants/app_strings.dart';
import 'package:shora/core/utils/extensions/date_ex.dart';

import '../../../domain/entity/report_card_entity.dart';
import '../../controller/reports_controller.dart';

class ReportDataCard extends StatelessWidget {
  const ReportDataCard({
    super.key,
    required this.reportData,
    this.openDetails = true,
  });
  final ReportCardEntity reportData;
  final bool openDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: openDetails
          ? const EdgeInsets.only(top: AppConst.smallPadding)
          : EdgeInsets.zero,
      child: InkWell(
        onTap: openDetails
            ? () => Get.toNamed(
                  AppRoute.questions,
                  arguments: {
                    AppString.customerId:
                        Get.find<ReportsController>().customerId,
                    AppString.reportData: reportData,
                  },
                )
            : null,
        borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.defaultPadding,
            vertical: AppConst.smallPadding,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (reportData.reportOwnerName != null)
                      _Text(
                        reportData.reportOwnerName!,
                        color: context.theme.primaryColor,
                      ),
                    _Text(S.of(context).reportNoNumber(reportData.reportId)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _Text(
                  reportData.createdAt.ddMMYYYY,
                  decoration: TextDecoration.underline,
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDataCardHeader extends StatelessWidget {
  const ReportDataCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppConst.smallPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
        vertical: AppConst.smallPadding,
      ),
      color: context.theme.primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: _Text(S.of(context).reportNo),
          ),
          Expanded(flex: 2, child: _Text(S.of(context).date)),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.text, {this.color, this.decoration});

  final String text;
  final Color? color;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
          decoration: decoration,
        ),
      ),
    );
  }
}
