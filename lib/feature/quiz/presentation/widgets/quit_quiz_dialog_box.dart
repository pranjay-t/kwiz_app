import 'package:flutter/material.dart';
import 'package:kwiz_app/feature/quiz/presentation/pages/quiz_home_page.dart';

class QuitQuizDialogBox extends StatelessWidget {
  const QuitQuizDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.black,
      title: Text(
        'Quit Quiz',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'Are you sure you want to quit the quiz?',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
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
          child: Text(
            'Quit',
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
