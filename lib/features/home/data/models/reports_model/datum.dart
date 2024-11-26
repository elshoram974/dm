import 'dart:convert';

import 'package:shora/features/home/domain/entity/report_card_entity.dart';

import 'distributor.dart';

class Datum extends ReportCardEntity {
  final int id;
  final int? repId;
  final int? customerId;
  final dynamic note;
  final DateTime? createdAtModel;
  final DateTime? updatedAt;
  final Distributor? distributor;

  Datum({
    required this.id,
    this.repId,
    this.customerId,
    this.note,
    this.createdAtModel,
    this.updatedAt,
    this.distributor,
  }) : super(
          reportId: id,
          reportNo: repId ?? 0,
          createdAt: createdAtModel ?? DateTime.now(),
          reportOwnerName: customerId.toString(),
        );

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int,
        repId: data['rep_id'] as int?,
        customerId: data['customer_id'] as int?,
        note: data['note'] as dynamic,
        createdAtModel: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        distributor: data['distributor'] == null
            ? null
            : Distributor.fromMap(data['distributor'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'rep_id': repId,
        'customer_id': customerId,
        'note': note,
        'created_at': createdAtModel?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'distributor': distributor?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? id,
    int? repId,
    int? customerId,
    dynamic note,
    DateTime? createdAtModel,
    DateTime? updatedAt,
    Distributor? distributor,
  }) {
    return Datum(
      id: id ?? this.id,
      repId: repId ?? this.repId,
      customerId: customerId ?? this.customerId,
      note: note ?? this.note,
      createdAtModel: createdAtModel ?? this.createdAtModel,
      updatedAt: updatedAt ?? this.updatedAt,
      distributor: distributor ?? this.distributor,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      repId,
      customerId,
      note,
      createdAtModel,
      updatedAt,
      distributor,
    ];
  }
}
