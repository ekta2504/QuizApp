import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\`s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'Red', 'score': 9},
        {'text': 'Pink', 'score': 8},
      ],
    },
    {
      'questionText': 'What\`s your favourite food?',
      'answers': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Manchurian', 'score': 8},
        {'text': 'PaniPuri', 'score': 10},
        {'text': 'Burger', 'score': 9}
      ],
    },
    {
      'questionText': 'What\`s your hobby?',
      'answers': [
        {'text': 'Dance', 'score': 10},
        {'text': 'Sports', 'score': 9},
        {'text': 'Singing', 'score': 8},
        {'text': 'Skatting', 'score': 9}
      ],
    },
  ];
  var _questionIndex = 0; //to change question dynamically
  var _totalscore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalscore=0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool = false;
    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1; //to change question dynamically
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
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
                questions: _questions,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
