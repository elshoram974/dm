import 'dart:convert';

import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final dynamic url;
  final String? label;
  final bool? active;

  const Link({this.url, this.label, this.active});

  factory Link.fromMap(Map<String, dynamic> data) => Link(
        url: data['url'] as dynamic,
        label: data['label'] as String?,
        active: data['active'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'label': label,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Link].
  factory Link.fromJson(String data) {
    return Link.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Link] to a JSON string.
  String toJson() => json.encode(toMap());

  Link copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, label, active];
}
