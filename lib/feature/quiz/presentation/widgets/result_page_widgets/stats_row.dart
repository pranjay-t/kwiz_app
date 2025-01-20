import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';

class StatsRow extends StatelessWidget {
  final int score;

  const StatsRow({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Score Display
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You\'ve scored ',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '$score',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Pallete.correctColor,
              ),
            ),
            const Text(
              ' points!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Stats Display (Coins & XP)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Coins Earned
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/gold.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '275',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Pallete.correctColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Coins Earned',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // XP Earned
            Column(
              children: [
                Text(
                  '270+',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Pallete.appTheme,
                  ),
                ),
                const Text(
                  'XP Earned',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
