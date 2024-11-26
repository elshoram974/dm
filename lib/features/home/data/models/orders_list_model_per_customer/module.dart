import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'storage.dart';
import 'translation.dart';

class Module extends Equatable {
  final int? id;
  final String? moduleName;
  final String? moduleType;
  final String? thumbnail;
  final String? status;
  final int? storesCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? icon;
  final int? themeId;
  final String? description;
  final int? allZoneService;
  final String? iconFullUrl;
  final String? thumbnailFullUrl;
  final List<Storage>? storage;
  final List<Translation>? translations;

  const Module({
    this.id,
    this.moduleName,
    this.moduleType,
    this.thumbnail,
    this.status,
    this.storesCount,
    this.createdAt,
    this.updatedAt,
    this.icon,
    this.themeId,
    this.description,
    this.allZoneService,
    this.iconFullUrl,
    this.thumbnailFullUrl,
    this.storage,
    this.translations,
  });

  factory Module.fromMap(Map<String, dynamic> data) => Module(
        id: data['id'] as int?,
        moduleName: data['module_name'] as String?,
        moduleType: data['module_type'] as String?,
        thumbnail: data['thumbnail'] as String?,
        status: data['status'] as String?,
        storesCount: data['stores_count'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        icon: data['icon'] as String?,
        themeId: data['theme_id'] as int?,
        description: data['description'] as String?,
        allZoneService: data['all_zone_service'] as int?,
        iconFullUrl: data['icon_full_url'] as String?,
        thumbnailFullUrl: data['thumbnail_full_url'] as String?,
        storage: (data['storage'] as List<dynamic>?)
            ?.map((e) => Storage.fromMap(e as Map<String, dynamic>))
            .toList(),
        translations: (data['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'module_name': moduleName,
        'module_type': moduleType,
        'thumbnail': thumbnail,
        'status': status,
        'stores_count': storesCount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'icon': icon,
        'theme_id': themeId,
        'description': description,
        'all_zone_service': allZoneService,
        'icon_full_url': iconFullUrl,
        'thumbnail_full_url': thumbnailFullUrl,
        'storage': storage?.map((e) => e.toMap()).toList(),
        'translations': translations?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Module].
  factory Module.fromJson(String data) {
    return Module.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Module] to a JSON string.
  String toJson() => json.encode(toMap());

  Module copyWith({
    int? id,
    String? moduleName,
    String? moduleType,
    String? thumbnail,
    String? status,
    int? storesCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? icon,
    int? themeId,
    String? description,
    int? allZoneService,
    String? iconFullUrl,
    String? thumbnailFullUrl,
    List<Storage>? storage,
    List<Translation>? translations,
  }) {
    return Module(
      id: id ?? this.id,
      moduleName: moduleName ?? this.moduleName,
      moduleType: moduleType ?? this.moduleType,
      thumbnail: thumbnail ?? this.thumbnail,
      status: status ?? this.status,
      storesCount: storesCount ?? this.storesCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      icon: icon ?? this.icon,
      themeId: themeId ?? this.themeId,
      description: description ?? this.description,
      allZoneService: allZoneService ?? this.allZoneService,
      iconFullUrl: iconFullUrl ?? this.iconFullUrl,
      thumbnailFullUrl: thumbnailFullUrl ?? this.thumbnailFullUrl,
      storage: storage ?? this.storage,
      translations: translations ?? this.translations,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      moduleName,
      moduleType,
      thumbnail,
      status,
      storesCount,
      createdAt,
      updatedAt,
      icon,
      themeId,
      description,
      allZoneService,
      iconFullUrl,
      thumbnailFullUrl,
      storage,
      translations,
    ];
  }
}
