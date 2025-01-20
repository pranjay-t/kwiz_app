import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';

class AnswerKeyStamp extends StatelessWidget {
  final Quiz quiz;
  final QuizResponse quizResponse;
  const AnswerKeyStamp(
      {super.key, required this.quiz, required this.quizResponse});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buttonWidget(context, 'Correct', Pallete.correctColor),
        _buttonWidget(context, 'Incorrect', Pallete.inCorrectColor),
        _buttonWidget(context, 'Not Attempted', Pallete.notAttemptedColor),
      ],
    );
  }
}

Widget _buttonWidget(BuildContext context, String text, Color color) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
