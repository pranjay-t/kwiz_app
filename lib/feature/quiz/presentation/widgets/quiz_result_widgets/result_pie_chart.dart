import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultPieChart extends StatelessWidget {
  final int correctCount;
  final int inCorrectCount;
  final int notAttemptedCount;
  const ResultPieChart({
    super.key,
    required this.correctCount,
    required this.inCorrectCount,
    required this.notAttemptedCount,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> userResult = {
      "Correct": correctCount.toDouble(),
      "Incorrect": inCorrectCount.toDouble(),
      "Not Attempted": notAttemptedCount.toDouble(),
    };
    return PieChart(
      animationDuration: Duration(seconds: 2),
      dataMap: userResult,
      chartLegendSpacing: 30,
      colorList: [
        Pallete.correctColor,
        Pallete.inCorrectColor,
        Pallete.notAttemptedColor,
      ],
      chartRadius: 170,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.left,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
