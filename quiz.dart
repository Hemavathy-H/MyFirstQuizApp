import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questIndex;
  // ignore: non_constant_identifier_names
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questions[questIndex]['questionText'] as String), //for Map class
        ...(questions[questIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
