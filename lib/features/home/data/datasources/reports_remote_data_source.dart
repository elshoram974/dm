import 'package:flutter/material.dart';
import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/constants/app_strings.dart';
import 'package:shora/core/utils/extensions/date_ex.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';
import 'package:shora/core/utils/services/api_services.dart';

import '../../domain/entity/report_card_entity.dart';
import '../models/reports_model/reports_model.dart';

abstract class ReportsRemoteDataSource {
  const ReportsRemoteDataSource();
  Future<PaginatedData<List<ReportCardEntity>>> getReports(
    int page,
    String customerId,
    DateTimeRange? range,
  );
}

class ReportsRemoteDataSourceImp extends ReportsRemoteDataSource {
  const ReportsRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<PaginatedData<List<ReportCardEntity>>> getReports(
    int page,
    String customerId,
    DateTimeRange? range,
  ) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.getReports}/$customerId?page=$page&${AppString.reportDate}=${range != null ? "${range.start.ddMMYYYYSlash} - ${range.end.ddMMYYYYSlash}" : ''}",
    );
    final ReportsModel model = ReportsModel.fromMap(res);
    return PaginatedData<List<ReportCardEntity>>(
      pagination: PaginationModel.fromMap(model.meta?.toMap() ?? {}),
      data: model.data ?? [],
    );
  }
}
