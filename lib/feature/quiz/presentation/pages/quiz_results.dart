import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/core/common/widgets/loader.dart';
import 'package:kwiz_app/core/utils/show_snackbar.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/question_summary.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_result_widgets/question_ans_box.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_result_widgets/answer_key_stamp.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/quiz_result_widgets/result_card.dart';
import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';

class QuizResults extends StatelessWidget {
  final Quiz quiz;
  final List<int?> selectedAnswer;

  const QuizResults({
    super.key,
    required this.quiz,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    context
        .read<QuizBloc>()
        .add(QuizResponseEvent(quiz: quiz, selectedAnswers: selectedAnswer));
    return BlocConsumer<QuizBloc, QuizState>(listener: (context, state) {
      if (state is QuizFailure) {
        showSnackbar(context, state.error);
      }
    }, builder: (context, state) {
      if (state is QuizLoading) {
        return const Loader();
      } else if (state is QuizResponseSuccess) {
        final quizResponse = state.quizResponse;
        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Result',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  ResultCard(
                    quiz: quiz,
                    quizResponse: quizResponse,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Answer Key',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionSummary(
                              quiz: quiz,
                              quizResponse: quizResponse,
                            ),
                          ),
                        ),
                        child: Text(
                          'summary >',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AnswerKeyStamp(
                    quiz: quiz,
                    quizResponse: quizResponse,
                  ),
                  QuestionAnsBox(
                    totalQuestions: quiz.questionsCount,
                    quizResponse: quizResponse,
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
