import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/questions_screen.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/quiz_home_page.dart';

class PlayAgainPage extends StatelessWidget {
  const PlayAgainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Supercharge Your IQ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Let\'s Do This Again!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'assets/images/play_again.png',
            width: 250,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => QuizHomePage()),
                (route) => false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.appTheme,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
            ),
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }
}
