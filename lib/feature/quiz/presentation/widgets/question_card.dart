import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/question.dart';

class QuestionCard extends StatelessWidget {
  final int seconds;
  final Question question;
  final int? selectedAnswer;
  final Function(int) onAnswerSelected;

  const QuestionCard({
    super.key,
    required this.seconds,
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.cardColor.withAlpha((0.6 * 255).toInt()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '${seconds}s',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: seconds / 60,
                    valueColor: const AlwaysStoppedAnimation(Pallete.appTheme),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              question.description,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: question.options.length,
              itemBuilder: (BuildContext context, int index) {
                final option = question.options[index];
                final isSelected = selectedAnswer == index;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => onAnswerSelected(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Pallete.appTheme
                              : Pallete.optionColor,
                          border: Border.all(
                            color: isSelected ? Pallete.appTheme : Colors.grey,
                            width: isSelected ? 2 : 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${index + 1}. ${option.description}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
