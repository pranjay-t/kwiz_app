import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/quiz_home_page.dart';

class QuitQuizDialogBox extends StatelessWidget {
  const QuitQuizDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Pallete.appTheme,
      title: Text(
        'Quit Quiz',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'Are you sure you want to quit the quiz?',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 8, 156, 13),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizHomePage()),
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  'Quit',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 169, 44, 35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
