import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'link.dart';

class PaginatedData<T> extends Equatable {
  const PaginatedData({
    required this.pagination,
    required this.data,
  });

  final PaginationModel pagination;
  final T data;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [pagination, data];
  }
}

class PaginationModel extends Equatable {
  const PaginationModel({
    required this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaginationModel].
  factory PaginationModel.fromJson(String data) {
    return PaginationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory PaginationModel.fromMap(Map<String, dynamic> data) {
    return PaginationModel(
      currentPage: data['current_page'] as int,
      firstPageUrl: data['first_page_url'] as String?,
      from: data['from'] as int?,
      lastPage: data['last_page'] as int?,
      lastPageUrl: data['last_page_url'] as String?,
      links: (data['links'] as List<dynamic>?)
          ?.map((e) => Link.fromMap(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: data['next_page_url'] as dynamic,
      path: data['path'] as String?,
      perPage: data['per_page'] as int?,
      prevPageUrl: data['prev_page_url'] as dynamic,
      to: data['to'] as int?,
      total: data['total'] as int,
    );
  }
  final int currentPage;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  Map<String, dynamic> toMap() => {
        'current_page': currentPage,
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toMap()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Converts [PaginationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PaginationModel copyWith({
    int? currentPage,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return PaginationModel(
      currentPage: currentPage ?? this.currentPage,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
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
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
