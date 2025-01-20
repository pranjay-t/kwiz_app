import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/question.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/question_summary_widgets/option_tile_widget.dart';

class QuestionCardWidget extends StatelessWidget {
  final Question question;
  final bool isSolutionHidden;
  final VoidCallback toggleSolution;
  final int? selectedAnswer;

  const QuestionCardWidget({
    super.key,
    required this.question,
    required this.isSolutionHidden,
    required this.toggleSolution,
    required this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color.fromARGB(255, 222, 219, 219),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.description,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final option = question.options[index];
                final isCorrect = option.isCorrect;
                final isSelected = selectedAnswer == index;
                return OptionTile(
                  index: index,
                  description: option.description,
                  isSelected: isSelected,
                  isCorrect: isCorrect,
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: toggleSolution,
              child: Text(
                isSolutionHidden ? 'view solution' : 'solution',
                style: TextStyle(
                  color: Pallete.appTheme,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (!isSolutionHidden)
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
                        color: Colors.black, fontSize: 20, height: 1.2),
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
  }
}
