import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/functions/handle_response_in_controller.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';

import '../../domain/entity/report_card_entity.dart';
import '../../domain/repositories/reports_repo.dart';

abstract class ReportsController extends GetxController {
  ReportsController({required this.repo});
  final ReportsRepositories repo;
  Status? getReportStatus;

  List<ReportCardEntity> _reports = [];
  List<ReportCardEntity> get reports => _reports;

  int page = 1;
  int totalReports = -1;

  ScrollController scrollController = ScrollController();
  late String _customerId;
  String get customerId => _customerId;

  Future<void> getReports(bool reload);
}

class ReportsControllerImp extends ReportsController {
  ReportsControllerImp({required super.repo}) {
    _customerId = Get.arguments;
    getReports(false);
    scrollController.addListener(_paginationFn);
  }


  @override
  void onClose() {
    scrollController.removeListener(_paginationFn);
    scrollController.dispose();
    super.onClose();
  }

  @override
  Future<void> getReports(bool reload) async {
    page = 1;

    if (!reload) {
      getReportStatus = const Loading();
      update();
    }

    await handleResponseInController<PaginatedData<List<ReportCardEntity>>>(
      status: await repo.getReports(page, _customerId),
      onSuccess: (data) {
        _reports = data.data;
        page = data.pagination.currentPage;
        totalReports = data.pagination.total;
      },
    );
    getReportStatus = null;
    update();
  }

  Future<void> _getPaginatedReports() async {
    getReportStatus = const Loading(true);
    update();

    await handleResponseInController<PaginatedData<List<ReportCardEntity>>>(
      status: await repo.getReports(++page, _customerId),
      onSuccess: (data) {
        _reports.addAll(data.data);
        page = data.pagination.currentPage;
        totalReports = data.pagination.total;
      },
    );
    getReportStatus = null;
    update();
  }

  void _paginationFn() {
    if (getReportStatus is! Loading &&
        reports.length < totalReports &&
        scrollController.offset >=
            0.9 * scrollController.position.maxScrollExtent) {
      _getPaginatedReports();
    }
  }
}
