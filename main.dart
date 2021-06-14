import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      //map
      'questionText': 'Who invented the Light Bulb?',
      'answers': [
        {'text': 'James Alpha', 'score': 0},
        {'text': 'Right Brothers', 'score': 0},
        {'text': 'Thomas Edison', 'score': 1},
        {'text': 'Newton', 'score': 0},
      ],
    },
    {
      'questionText': 'Which is the largest continent?',
      'answers': [
        {'text': 'Australia', 'score': 0},
        {'text': 'Asia', 'score': 1},
        {'text': 'America', 'score': 0},
        {'text': 'Africa', 'score': 0},
      ],
    },
    {
      'questionText': 'Who is known as the Iron Man of India?',
      'answers': [
        {'text': 'Nehru', 'score': 0},
        {'text': 'Gandhi', 'score': 0},
        {'text': 'Bhagat Singh', 'score': 0},
        {'text': 'Bose', 'score': 1},
      ],
    },
    {
      'questionText': 'Who was the first woman President of India?',
      'answers': [
        {'text': 'Pratibha Patil', 'score': 1},
        {'text': 'Indira Gandhi', 'score': 0},
        {'text': 'Jhansi Rani', 'score': 0},
        {'text': 'J Jayalalitha', 'score': 0},
      ],
    },
    {
      'questionText': 'Which animal never drinks water in its entire life?',
      'answers': [
        {'text': 'Russian cat', 'score': 0},
        {'text': 'Camel', 'score': 0},
        {'text': 'Kangaroo rat', 'score': 1},
        {'text': 'Donkey', 'score': 0},
      ],
    },
  ];

  var _questIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {});
    _questIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      //setstate updates the widget by calling its build() again  and build() rebuilds widget tree
      _questIndex = _questIndex + 1;
    });
    print(_questIndex);
    if (_questIndex < _questions.length) {
      print("We have more questions...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text('My First Quiz App'),
              backgroundColor: Colors.purple[400]),
          body: _questIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questIndex: _questIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
