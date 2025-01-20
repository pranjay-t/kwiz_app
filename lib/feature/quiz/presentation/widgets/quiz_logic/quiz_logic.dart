import 'package:kwiz_app/feature/quiz/domain/entities/question.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';

class QuizLogic {
  final Quiz quiz;
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;

  QuizLogic(this.quiz);

  Question get currentQuestion => quiz.questions[currentQuestionIndex];

  bool get hasNextQuestion => currentQuestionIndex < quiz.questionsCount - 1;

  void selectOption(int index) {
    selectedOptionIndex = index;
  }

  void nextQuestion() {
    if (hasNextQuestion) {
      currentQuestionIndex++;
      selectedOptionIndex = null;
    }
  }
}