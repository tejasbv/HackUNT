import 'package:flutter/material.dart';
import 'package:futurepocalypse/Survey/quiz.dart';
import 'package:futurepocalypse/Survey/result.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _questions = [
    {
      "QuestionText":
          "Has the apocalypse affected you or an immediate family member in any way?",
      "answers": [
        {"text": "Yes, it has affected me", "score": 10},
        {"text": "Yes, a family member", "score": 6},
        {"text": "No", "score": 20},
      ]
    },
    {
      "QuestionText": "Has this disaster left you homeless?",
      "answers": [
        {"text": "Yes", "score": 1},
        {"text": "No", "score": 5},
      ]
    },
    {
      "QuestionText": "In which areas do you need assistance?",
      "answers": [
        {"text": "Housing ", "score": 10},
        {"text": "Food", "score": 6},
        {"text": "Employment", "score": 1},
        {"text": "Medical", "score": 5},
        {"text": "Financial", "score": 7},
      ]
    },
    {
      "QuestionText": "What describes the area you currently reside in?",
      "answers": [
        {"text": "Urban ", "score": 10},
        {"text": "Rural", "score": 6},
        {"text": "Suburban", "score": 7},
      ]
    },
  ];
  int questionIndex = 0;
  int _totalScore = 0;

  void reset() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      questionIndex += 1;
    });
    _totalScore += score;
    // print("answer ");
    // print(questionIndex);
    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage("assets/images/back2.jpg"),
                fit: BoxFit.cover,
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              child: questionIndex < _questions.length
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Quiz(_answerQuestion, _questions, questionIndex)
                      ],
                    )
                  : Result(),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
