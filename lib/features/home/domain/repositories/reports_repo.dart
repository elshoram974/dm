import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import '../entity/report_card_entity.dart';

abstract class ReportsRepositories {
  const ReportsRepositories();

  Future<Status<PaginatedData<List<ReportCardEntity>>>> getReports(int page);
}
