import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';

class QuestionSummary extends StatefulWidget {
  final Quiz quiz;
  final QuizResponse quizResponse;

  const QuestionSummary(
      {super.key, required this.quiz, required this.quizResponse});

  @override
  State<QuestionSummary> createState() => _QuestionSummaryState();
}

class _QuestionSummaryState extends State<QuestionSummary> {
  late List<bool> hideSolutionList;

  @override
  void initState() {
    super.initState();
    // Initialize the hideSolution state for each question
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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image with blur
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.asset(
                'assets/images/app_bg.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: widget.quiz.questionsCount,
              itemBuilder: (context, qindex) {
                final question = widget.quiz.questions[qindex];
                return Card(
                  elevation: 2,
                  color: const Color.fromARGB(255, 222, 219, 219),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question header
                        Row(
                          children: [
                            Text(
                              'Q.${qindex + 1}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '/${widget.quiz.questionsCount}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 116, 115, 115),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Question description
                        Text(
                          question.description,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Options list
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: question.options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final option = question.options[index];
                            bool isSelected =
                                widget.quizResponse.selectedAnswers[qindex] ==
                                    index;
                            bool isCorrect = option.isCorrect;

                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: isCorrect
                                        ? Pallete.correctColor
                                        : (isSelected
                                            ? Pallete.inCorrectColor
                                            : Pallete.notAttemptedColor),
                                    border: Border.all(
                                      color: isCorrect
                                          ? Pallete.correctColor
                                          : (isSelected
                                              ? Pallete.inCorrectColor
                                              : Pallete.notAttemptedColor),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${index + 1}. ${option.description}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            );
                          },
                        ),
                        // Toggle solution button
                        GestureDetector(
                          onTap: () => toggleSolution(qindex),
                          child: Text(
                            hideSolutionList[qindex]
                                ? 'view solution'
                                : 'solution',
                            style: TextStyle(
                              color: Pallete.appTheme,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (!hideSolutionList[qindex])
                          Container(
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: Markdown(
                              data: question.solution,
                              styleSheet: MarkdownStyleSheet(
                                h1: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                p: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    height: 1.2),
                                listBullet: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
