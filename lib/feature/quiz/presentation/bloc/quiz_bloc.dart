import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwiz_app/core/usecase/usecase.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz_response.dart';
import 'package:kwiz_app/feature/quiz/domain/usecases/get_quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuiz _getQuiz;
  QuizBloc({
    required GetQuiz getQuiz,
  })  : _getQuiz = getQuiz,
        super(QuizInitial()) {
    on<QuizEvent>((event, emit) => emit(QuizLoading()));
    on<GetQuizEvent>(_onGetQuiz);
    on<QuizResponseEvent>(_onQuizResponse);
  }

  void _onQuizResponse(QuizResponseEvent event, Emitter<QuizState> emit) async {
    final quiz = event.quiz;
    final selectedAnswer = event.selectedAnswers;

    int score = 0;
    List<int?> correctIndexes = [];
    List<int?> incorrectIndexes = [];
    List<int?> notAttemptedIndexes = [];

    try {
      for (int i = 0; i < quiz.questionsCount; i++) {
      final selectedIndex = selectedAnswer[i];

      if (selectedIndex != null) {
        final selectedOption = quiz.questions[i].options[selectedIndex];
        final correctOption = quiz.questions[i].options.firstWhere(
          (option) => option.isCorrect == true,
        );

        if (selectedOption.description == correctOption.description) {
          score += double.parse(quiz.correctAnswerMarks).toInt();
          correctIndexes.add(i); 
        } else {
          score -= double.parse(quiz.negativeMarks).toInt();
          incorrectIndexes.add(i);
        }
      } else {
        notAttemptedIndexes.add(i); 
      }
    }

    final quizResponse = QuizResponse(
      score: score,
      correctIndexes: correctIndexes,
      incorrectIndexes: incorrectIndexes,
      notAttemptedIndexes: notAttemptedIndexes,
      selectedAnswers: selectedAnswer,
    );
    emit(QuizResponseSuccess(quizResponse));
    } catch (e) {
      print(e.toString());
      emit(QuizFailure(e.toString()));
    }

  }

  void _onGetQuiz(GetQuizEvent event, Emitter<QuizState> emit) async {
    final res = await _getQuiz(NoParams());
    res.fold((l) {
      emit(QuizFailure(l.message));
    }, (r) {
      emit(QuizFetchSuccess(r));
    });
  }
}
