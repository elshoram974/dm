import 'package:shora/core/utils/constants/app_links.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';
import 'package:shora/core/utils/services/api_services.dart';

import '../../domain/entity/report_card_entity.dart';

abstract class ReportsRemoteDataSource {
  const ReportsRemoteDataSource();
  Future<PaginatedData<List<ReportCardEntity>>> getReports(int page);
}

class ReportsRemoteDataSourceImp extends ReportsRemoteDataSource {
  const ReportsRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<PaginatedData<List<ReportCardEntity>>> getReports(
    int page,
  ) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks}?page=$page",
    );
    final List<ReportCardEntity> reports = List.empty(growable: true);
    for (final Map<String, dynamic> d in res['data']['data']) {
      // reports.add(CustomerModel.fromMap(d));
    }

    return PaginatedData<List<ReportCardEntity>>(
      pagination: PaginationModel.fromMap(res['data']),
      data: reports,
    );
  }
}
