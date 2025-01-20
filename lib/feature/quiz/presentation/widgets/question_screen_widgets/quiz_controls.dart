import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/result_page.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/question_card.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/question_page_button.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/quit_quiz_dialog_box.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_screen_widgets/submit_ans.dart';

class QuizControls extends StatelessWidget {
  final Quiz quiz;
  final int currentQuestionIndex;
  final int seconds;
  final List<int?> selectedAnswers;
  final Function(int) onAnswerSelected;
  final Function(int) onNextQuestion;
  final Timer? timer;

  const QuizControls({
    super.key,
    required this.quiz,
    required this.currentQuestionIndex,
    required this.seconds,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.onNextQuestion,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    final currQuestion = quiz.questions[currentQuestionIndex];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Question ${currentQuestionIndex + 1}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/${quiz.questions.length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: currentQuestionIndex.toDouble() + 1,
              min: 1,
              max: quiz.questions.length.toDouble(),
              divisions: quiz.questions.length,
              activeColor: Pallete.appTheme,
              inactiveColor: Colors.white,
              onChanged: (value) {},
            ),
            QuestionCard(
              seconds: seconds,
              question: currQuestion,
              selectedAnswer: selectedAnswers[currentQuestionIndex],
              onAnswerSelected: onAnswerSelected,
            ),
            const SizedBox(height: 20),
            currentQuestionIndex == quiz.questionsCount - 1
                ? SubmitAns(
                    title: 'Submit your answers',
                    onPressed: () {
                      timer?.cancel();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            quiz: quiz,
                            selectedAnswer: selectedAnswers,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuestionPageButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const QuitQuizDialogBox(),
                          );
                        },
                        title: 'Quit Quiz',
                      ),
                      QuestionPageButton(
                        onPressed: () => onNextQuestion(quiz.questions.length),
                        title: 'Next',
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
