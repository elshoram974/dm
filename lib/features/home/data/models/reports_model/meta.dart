import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'link.dart';

class Meta extends Equatable {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromMap(Map<String, dynamic> data) => Meta(
        currentPage: data['current_page'] as int?,
        from: data['from'] as int?,
        lastPage: data['last_page'] as int?,
        links: (data['links'] as List<dynamic>?)
            ?.map((e) => Link.fromMap(e as Map<String, dynamic>))
            .toList(),
        path: data['path'] as String?,
        perPage: data['per_page'] as int?,
        to: data['to'] as int?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'links': links?.map((e) => e.toMap()).toList(),
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
  factory Meta.fromJson(String data) {
    return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
  String toJson() => json.encode(toMap());

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) {
    return Meta(
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      links: links ?? this.links,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currentPage,
      from,
      lastPage,
      links,
      path,
      perPage,
      to,
      total,
    ];
  }
}
