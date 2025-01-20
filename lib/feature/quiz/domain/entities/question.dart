import 'package:kwiz_app/feature/quiz/domain/entities/question_option.dart';

class Question {
  final String description;
  final String solution;
  final List<QuestionOption> options;

  Question({
    required this.description,
    required this.options,
    required this.solution,
  });
}
