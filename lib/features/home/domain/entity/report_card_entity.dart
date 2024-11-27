import 'package:equatable/equatable.dart';

class ReportCardEntity extends Equatable {
  const ReportCardEntity({
    required this.reportId,
    this.reportOwnerName,
    required this.createdAt,
  });

  factory ReportCardEntity.example() {
    return ReportCardEntity(
      reportId: 5,
      reportOwnerName: 'Devetechno',
      createdAt: DateTime.now(),
    );
  }

  final int reportId;
  final String? reportOwnerName;
  final DateTime createdAt;
  @override
  List<Object?> get props => [reportId, reportOwnerName, createdAt];
}
