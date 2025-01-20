
import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';

class PlayerCard extends StatelessWidget {
  final int rank;
  final String playerName;
  final int coinsEarned;
  final int score;
  final int avatarIndex;

  const PlayerCard({
    super.key,
    required this.rank,
    required this.playerName,
    required this.coinsEarned,
    required this.score,
    required this.avatarIndex,
  });

  String getRankSuffix(int rank) {
    if (rank == 1) return 'st';
    if (rank == 2) return 'nd';
    if (rank == 3) return 'rd';
    return 'th';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 231, 228, 228),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Text(
                '$rank${getRankSuffix(rank)}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  // Avatar
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Pallete.appTheme,
                    ),
                    child: Image.asset(
                      'assets/images/face$avatarIndex.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Player Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playerName,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Won',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/gold.png',
                            width: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$coinsEarned',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Score
            Text(
              '$score',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
