import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/question_summary_widgets/question_card_widget.dart';

class QuestionSummary extends StatefulWidget {
  final Quiz quiz;
  final QuizResponse quizResponse;

  const QuestionSummary({
    super.key,
    required this.quiz,
    required this.quizResponse,
  });

  @override
  State<QuestionSummary> createState() => _QuestionSummaryState();
}

class _QuestionSummaryState extends State<QuestionSummary> {
  late List<bool> hideSolutionList;

  @override
  void initState() {
    super.initState();
    hideSolutionList = List<bool>.filled(widget.quiz.questionsCount, true);
  }

  void toggleSolution(int index) {
    setState(() {
      hideSolutionList[index] = !hideSolutionList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 20, 99),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Pallete.appTheme, size: 35),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child:
                  Image.asset('assets/images/app_bg.jpeg', fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: widget.quiz.questionsCount,
              itemBuilder: (context, qindex) {
                final question = widget.quiz.questions[qindex];
                return QuestionCardWidget(
                  question: question,
                  isSolutionHidden: hideSolutionList[qindex],
                  toggleSolution: () => toggleSolution(qindex),
                  selectedAnswer: widget.quizResponse.selectedAnswers[qindex],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
