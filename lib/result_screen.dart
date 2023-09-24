import 'package:flutter/material.dart';

import 'package:quiz_app/question_summary/question_summary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.restartQuiz,
    required this.chosenAnswers,
  });

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_name': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final questionAmount = questions.length;
    final correctQuestionAmount = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity, // 有多寬伸多寬
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直置中
          children: [
            Text('你在 $questionAmount 題中答對了 $correctQuestionAmount 題'),
            const SizedBox(height: 30),
            // Text('回顧題目：'),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                restartQuiz();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
