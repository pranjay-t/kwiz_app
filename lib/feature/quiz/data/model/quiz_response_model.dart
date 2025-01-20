import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';

class QuizResponseModel extends QuizResponse {
  QuizResponseModel({
    required super.score,
    required super.correctIndexes,
    required super.incorrectIndexes,
    required super.notAttemptedIndexes,
    required super.selectedAnswers,
  });
}
