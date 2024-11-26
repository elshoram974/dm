import 'dart:convert';

import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  const Links({this.first, this.last, this.prev, this.next});

  factory Links.fromMap(Map<String, dynamic> data) => Links(
        first: data['first'] as String?,
        last: data['last'] as String?,
        prev: data['prev'] as dynamic,
        next: data['next'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Links].
  factory Links.fromJson(String data) {
    return Links.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Links] to a JSON string.
  String toJson() => json.encode(toMap());

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) {
    return Links(
      first: first ?? this.first,
      last: last ?? this.last,
      prev: prev ?? this.prev,
      next: next ?? this.next,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [first, last, prev, next];
}
