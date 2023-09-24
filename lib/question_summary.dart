import 'package:flutter/cupertino.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Expanded(
                  // 限定自己的 child widget 只能顯現在自己畫出的空間
                  child: Column(
                    children: [
                      Text(data['question_name'] as String),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'] as String),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
