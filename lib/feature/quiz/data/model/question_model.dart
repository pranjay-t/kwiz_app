import 'package:kwiz_app/feature/quiz/data/model/question_option_model.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.description,
    required super.options,
    required super.solution,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> map) {
    return QuestionModel(
      description: map['description'] as String,
      options: (map['options'] as List<dynamic>)
          .map(
            (optionJson) => QuestionOptionModel.fromJson(
                optionJson as Map<String, dynamic>),
          )
          .toList(),
      solution: map['detailed_solution'] as String,
    );
  }
}
