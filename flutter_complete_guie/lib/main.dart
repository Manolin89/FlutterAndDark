import 'package:flutter/material.dart';
import 'package:flutter_complete_guie/result.dart';

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
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'balck', 'score': 10},
        {'text': 'red', 'score': 30},
        {'text': 'white', 'score': 40},
        {'text': 'blue', 'score': 50}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 1},
        {'text': 'lion', 'score': 2},
        {'text': 'hourse', 'score': 3},
        {'text': 'cat', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor',
      'answers': [
        {'text': 'Mane', 'score': 10},
        {'text': 'Mane', 'score': 10},
        {'text': 'Mane', 'score': 10},
        {'text': 'Mane', 'score': 10}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('Me have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore),
      ),
    );
  }
}
