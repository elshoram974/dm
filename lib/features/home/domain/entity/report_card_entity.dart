import 'package:equatable/equatable.dart';

class ReportCardEntity extends Equatable {
  const ReportCardEntity({
    required this.reportNo,
    this.reportOwnerName,
    required this.createdAt,
  });

  factory ReportCardEntity.example() {
    return ReportCardEntity(
      reportNo: '1234567890',
      reportOwnerName: 'John Doe',
      createdAt: DateTime.now(),
    );
  }

  final String reportNo;
  final String? reportOwnerName;
  final DateTime createdAt;
  @override
  List<Object?> get props => [reportNo, reportOwnerName, createdAt];
}
