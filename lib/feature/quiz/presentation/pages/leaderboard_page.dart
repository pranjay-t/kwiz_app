import 'package:flutter/material.dart';
import 'package:kwiz_app/feature/quiz/presentation/widgets/leaderboard_widget/player_card.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  final List<String> playerNames = const [
    "Emilia Williamson",
    "Liam Henderson",
    "Sophia Carter",
    "Noah Evans",
    "Oliver Johnson",
    "Ava Martinez",
    "Elijah Garcia",
    "Mia Rodriguez",
    "Charlotte Smith",
    "James Brown"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Rank',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                'Players',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                'Score',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: playerNames.length,
              itemBuilder: (context, index) {
                return PlayerCard(
                  rank: index + 1,
                  playerName: playerNames[index],
                  coinsEarned: (10 - index) * 30,
                  score: (4 - index) * 10,
                  avatarIndex: (index + 1) % 6,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
