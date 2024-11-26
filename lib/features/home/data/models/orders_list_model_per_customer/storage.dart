import 'dart:convert';

import 'package:equatable/equatable.dart';

class Storage extends Equatable {
  final int? id;
  final String? dataType;
  final String? dataId;
  final String? key;
  final String? value;
  final String? createdAt;
  final String? updatedAt;

  const Storage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Storage.fromMap(Map<String, dynamic> data) => Storage(
        id: data['id'] as int?,
        dataType: data['data_type'] as String?,
        dataId: data['data_id'] as String?,
        key: data['key'] as String?,
        value: data['value'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'data_type': dataType,
        'data_id': dataId,
        'key': key,
        'value': value,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Storage].
  factory Storage.fromJson(String data) {
    return Storage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Storage] to a JSON string.
  String toJson() => json.encode(toMap());

  Storage copyWith({
    int? id,
    String? dataType,
    String? dataId,
    String? key,
    String? value,
    String? createdAt,
    String? updatedAt,
  }) {
    return Storage(
      id: id ?? this.id,
      dataType: dataType ?? this.dataType,
      dataId: dataId ?? this.dataId,
      key: key ?? this.key,
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      dataType,
      dataId,
      key,
      value,
      createdAt,
      updatedAt,
    ];
  }
}
