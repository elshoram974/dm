import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  const QuestionModel({
    required this.id,
    required this.question,
    required this.type,
    this.ansA,
    required this.ansABool,
    this.ansB,
    required this.ansBBool,
    this.ansC,
    required this.ansCBool,
    this.ansD,
    required this.ansDBool,
  });
  factory QuestionModel.example() {
    return QuestionModel.fromMap(
      const {
        "id": 1,
        "text": "How satisfied are you with the product/service?",
        "type": "single",
        "ans_a": "A-class",
        "ans_a_bool": false,
        "ans_b": null,
        "ans_b_bool": false,
        "ans_c": "C-class",
        "ans_c_bool": false,
        "ans_d": "D-class",
        "ans_d_bool": false
      },
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QuestionModel].
  factory QuestionModel.fromJson(String data) {
    return QuestionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory QuestionModel.fromMap(Map<String, dynamic> data) => QuestionModel(
        id: data['id'] as int,
        question: data['text'] as String,
        type: QuestionType.getByName(data['type'] as String),
        ansA: data['ans_a'] as String?,
        ansABool: data['ans_a_bool'] as bool,
        ansB: data['ans_b'] as String?,
        ansBBool: data['ans_b_bool'] as bool,
        ansC: data['ans_c'] as String?,
        ansCBool: data['ans_c_bool'] as bool,
        ansD: data['ans_d'] as String?,
        ansDBool: data['ans_d_bool'] as bool,
      );
  final int id;
  final String question;
  final QuestionType type;
  final String? ansA;
  final bool ansABool;
  final String? ansB;
  final bool ansBBool;
  final String? ansC;
  final bool ansCBool;
  final String? ansD;
  final bool ansDBool;

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': question,
        'type': type,
        'ans_a': ansA,
        'ans_a_bool': ansABool,
        'ans_b': ansB,
        'ans_b_bool': ansBBool,
        'ans_c': ansC,
        'ans_c_bool': ansCBool,
        'ans_d': ansD,
        'ans_d_bool': ansDBool,
      };

  /// `dart:convert`
  ///
  /// Converts [QuestionModel] to a JSON string.
  String toJson() => json.encode(toMap());

  QuestionModel copyWith({
    int? id,
    String? question,
    QuestionType? type,
    String? ansA,
    bool? ansABool,
    String? ansB,
    bool? ansBBool,
    String? ansC,
    bool? ansCBool,
    String? ansD,
    bool? ansDBool,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      type: type ?? this.type,
      ansA: ansA ?? this.ansA,
      ansABool: ansABool ?? this.ansABool,
      ansB: ansB ?? this.ansB,
      ansBBool: ansBBool ?? this.ansBBool,
      ansC: ansC ?? this.ansC,
      ansCBool: ansCBool ?? this.ansCBool,
      ansD: ansD ?? this.ansD,
      ansDBool: ansDBool ?? this.ansDBool,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      question,
      type,
      ansA,
      ansABool,
      ansB,
      ansBBool,
      ansC,
      ansCBool,
      ansD,
      ansDBool,
    ];
  }
}

enum QuestionType {
  single,
  short,
  multi,
  other;

  factory QuestionType.getByName(String name) => _map[name] ?? other;
  static final Map<String, QuestionType> _map = {
    "single": single,
    "short": short,
    "multi": multi,
  };
}
