import 'package:kwiz_app/feature/quiz/domain/entities/question.dart';

class Quiz {
  final String topic;
  final String negativeMarks;
  final String correctAnswerMarks;
  final int questionsCount;
  final List<Question> questions;
  Quiz({
    required this.topic,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.questionsCount,
    required this.questions,
  });

}
