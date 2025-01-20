import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';

class QuestionAnsBox extends StatelessWidget {
  final int totalQuestions;
  final QuizResponse quizResponse;

  const QuestionAnsBox({
    super.key,
    required this.totalQuestions,
    required this.quizResponse,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 20),
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
        ),
        itemCount: totalQuestions,
        itemBuilder: (context, index) {
          bool isAnswered = quizResponse.selectedAnswers[index] != null;
          bool isCorrect = quizResponse.correctIndexes.contains(index);
          Color boxColor;
          Color borderColor;
          if (isAnswered) {
            if (isCorrect) {
              boxColor = Pallete.correctColor;
              borderColor = Pallete.correctColor;
            } else {
              boxColor = Pallete.inCorrectColor;
              borderColor = Pallete.inCorrectColor;
            }
          } else {
            boxColor = Pallete.notAttemptedColor;
            borderColor = Pallete.notAttemptedColor;
          }

          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: boxColor,
              border: Border.all(
                color: borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
