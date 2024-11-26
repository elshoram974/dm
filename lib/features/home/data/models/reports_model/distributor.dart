import 'dart:convert';

import 'package:equatable/equatable.dart';

class Distributor extends Equatable {
  final String? fName;
  final String? lName;

  String get name => '${fName ?? ''} ${lName ?? ''}'.trim();

  const Distributor({this.fName, this.lName});

  factory Distributor.fromMap(Map<String, dynamic> data) => Distributor(
        fName: data['f_name'] as String?,
        lName: data['l_name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'f_name': fName,
        'l_name': lName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Distributor].
  factory Distributor.fromJson(String data) {
    return Distributor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Distributor] to a JSON string.
  String toJson() => json.encode(toMap());

  Distributor copyWith({
    String? fName,
    String? lName,
  }) {
    return Distributor(
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fName, lName];
}
