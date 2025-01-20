import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';

class OptionTile extends StatelessWidget {
  final int index;
  final String description;
  final bool isSelected;
  final bool isCorrect;

  const OptionTile({
    super.key,
    required this.index,
    required this.description,
    required this.isSelected,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    final color = isCorrect
        ? Pallete.correctColor
        : (isSelected ? Pallete.inCorrectColor : Pallete.notAttemptedColor);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        '${index + 1}. $description',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
