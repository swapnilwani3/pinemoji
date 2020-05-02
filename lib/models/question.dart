// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Question questionFromJson(String str) => Question.fromMap(json.decode(str));

String questionToJson(Question data) => json.encode(data.toMap());

class Question {
  final String description;
  final String type;
  final List<String> answerList;
  final List<String> emojiList;

  Question({
    @required this.description,
    @required this.type,
    @required this.answerList,
    @required this.emojiList,
  });

  Question copyWith({
    String description,
    String type,
    List<String> answerList,
    List<String> emojiList,
  }) =>
      Question(
        description: description ?? this.description,
        type: type ?? this.type,
        answerList: answerList ?? this.answerList,
        emojiList: emojiList ?? this.emojiList,
      );

  factory Question.fromMap(Map<String, dynamic> json) => Question(
    description: json["description"] == null ? null : json["description"],
    type: json["type"] == null ? null : json["type"],
    answerList: json["answerList"] == null ? null : json["answerList"],
    emojiList: json["emojiList"] == null ? null : json["emojiList"],
  );

  Map<String, dynamic> toMap() => {
    "description": description == null ? null : description,
    "type": type == null ? null : type,
    "answerList": answerList == null ? null : answerList,
    "emojiList": emojiList == null ? null : emojiList,
  };
}

//{
//"description": "id",
//"type": "hex",
//"answerList":""
//}
