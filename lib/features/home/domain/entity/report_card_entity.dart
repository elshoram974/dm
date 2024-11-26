import 'package:equatable/equatable.dart';

class ReportCardEntity extends Equatable {
  const ReportCardEntity({
    required this.reportId,
    required this.reportNo,
    this.reportOwnerName,
    required this.createdAt,
  });

  factory ReportCardEntity.example() {
    return ReportCardEntity(
      reportId: 5,
      reportNo: 1234567890,
      reportOwnerName: 'Devetechno',
      createdAt: DateTime.now(),
    );
  }

  final int reportId;
  final int reportNo;
  final String? reportOwnerName;
  final DateTime createdAt;
  @override
  List<Object?> get props => [reportId, reportNo, reportOwnerName, createdAt];
}
