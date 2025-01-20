import 'package:kwiz_app/feature/quiz/domain/entities/question_option.dart';

class QuestionOptionModel extends QuestionOption {
  QuestionOptionModel({
    required super.description,
    required super.isCorrect,
  });

  factory QuestionOptionModel.fromJson(Map<String, dynamic> map) {
    return QuestionOptionModel(
      description: map['description'] as String? ?? '',
      isCorrect: map['is_correct'] as bool,
    );
  }
}
