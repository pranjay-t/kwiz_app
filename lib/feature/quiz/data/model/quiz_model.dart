import 'package:kwiz_app/feature/quiz/data/model/question_model.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';

class QuizModel extends Quiz {
  QuizModel({
    required super.topic,
    required super.negativeMarks,
    required super.correctAnswerMarks,
    required super.questionsCount,
    required super.questions,
  });

   factory QuizModel.fromJson(Map<String, dynamic> map) {
    return QuizModel(
      topic: map['topic'] as String? ?? '',
      negativeMarks: map['negative_marks'] as String? ?? '',
      correctAnswerMarks: map['correct_answer_marks'] as String? ?? '',
      questionsCount: map['questions_count'] as int,
      questions: (map['questions'] as List<dynamic>)
          .map((questionJson) => QuestionModel.fromJson(questionJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
