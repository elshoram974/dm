import 'dart:convert';

import 'package:equatable/equatable.dart';

class Translation extends Equatable {
  final int? id;
  final String? translationableType;
  final int? translationableId;
  final String? locale;
  final String? key;
  final String? value;
  final dynamic createdAt;
  final dynamic updatedAt;

  const Translation({
    this.id,
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromMap(Map<String, dynamic> data) => Translation(
        id: data['id'] as int?,
        translationableType: data['translationable_type'] as String?,
        translationableId: data['translationable_id'] as int?,
        locale: data['locale'] as String?,
        key: data['key'] as String?,
        value: data['value'] as String?,
        createdAt: data['created_at'] as dynamic,
        updatedAt: data['updated_at'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'translationable_type': translationableType,
        'translationable_id': translationableId,
        'locale': locale,
        'key': key,
        'value': value,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Translation].
  factory Translation.fromJson(String data) {
    return Translation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Translation] to a JSON string.
  String toJson() => json.encode(toMap());

  Translation copyWith({
    int? id,
    String? translationableType,
    int? translationableId,
    String? locale,
    String? key,
    String? value,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return Translation(
      id: id ?? this.id,
      translationableType: translationableType ?? this.translationableType,
      translationableId: translationableId ?? this.translationableId,
      locale: locale ?? this.locale,
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
      translationableType,
      translationableId,
      locale,
      key,
      value,
      createdAt,
      updatedAt,
    ];
  }
}
