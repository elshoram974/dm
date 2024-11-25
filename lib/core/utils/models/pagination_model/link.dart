import 'dart:convert';

import 'package:equatable/equatable.dart';

class Link extends Equatable {

  const Link({this.url, this.label, this.active});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Link].
  factory Link.fromJson(String data) {
    return Link.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Link.fromMap(Map<String, dynamic> data) => Link(
        url: data['url'] as dynamic,
        label: data['label'] as String?,
        active: data['active'] as bool?,
      );
  final String? url;
  final String? label;
  final bool? active;

  Map<String, dynamic> toMap() => {
        'url': url,
        'label': label,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Converts [Link] to a JSON string.
  String toJson() => json.encode(toMap());

  Link copyWith({
    String? url,
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
