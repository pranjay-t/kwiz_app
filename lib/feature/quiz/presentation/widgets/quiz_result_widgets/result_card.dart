
import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_result_widgets/result_pie_chart.dart';

class ResultCard extends StatelessWidget {
  final Quiz quiz;
  final QuizResponse quizResponse;
  const ResultCard({
    super.key,
    required this.quizResponse,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    final double accuracy = (quizResponse.correctIndexes.length * 100) /
        (quizResponse.correctIndexes.length +
            quizResponse.incorrectIndexes.length +
            quizResponse.notAttemptedIndexes.length);
    return Column(
      children: [
        Card(
          color: Pallete.appTheme,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MCQ QUESTIONS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Questions:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${quiz.questionsCount}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Accuracy:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${accuracy.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: Pallete.appTheme,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: ResultPieChart(
            correctCount: quizResponse.correctIndexes.length,
            inCorrectCount: quizResponse.incorrectIndexes.length,
            notAttemptedCount: quizResponse.notAttemptedIndexes.length,
          ),
        ),
      ],
    );
  }
}
