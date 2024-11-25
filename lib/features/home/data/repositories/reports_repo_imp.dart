import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';


import '../../domain/entity/report_card_entity.dart';
import '../../domain/repositories/reports_repo.dart';
import '../datasources/reports_remote_data_source.dart';

class ReportsRepositoriesImp extends ReportsRepositories {
  const ReportsRepositoriesImp(this.remoteDataSource);
  final ReportsRemoteDataSource remoteDataSource;

  @override
  Future<Status<PaginatedData<List<ReportCardEntity>>>> getReports(int page) {
    return executeAndHandleErrors<PaginatedData<List<ReportCardEntity>>>(
      () => remoteDataSource.getReports(page),
    );
  }
}
