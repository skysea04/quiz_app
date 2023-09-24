import 'package:flutter/material.dart';

import 'package:quiz_app/first_page.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeSceen = 1;

  void switchScreen() {
    setState(() {
      activeSceen = 2;
    });
  }

  void restartQuiz() {
    setState(() {
      activeSceen = 1;
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length >= questions.length) {
      setState(() {
        activeSceen = 3;
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = FirstPage(switchScreen);

    if (activeSceen == 2) {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeSceen == 3) {
      screenWidget = ResultScreen(
        restartQuiz: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.deepPurple,
          child: screenWidget,
        ),
      ),
    );
  }
}
