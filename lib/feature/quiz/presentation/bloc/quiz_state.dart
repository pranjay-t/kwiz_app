part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

class QuizInitial extends QuizState {}

class QuizFailure extends QuizState {
  final String error;
  QuizFailure(this.error);
}

class QuizLoading extends QuizState {}

class QuizFetchSuccess extends QuizState {
  final Quiz quiz;
  QuizFetchSuccess(this.quiz);
}

class QuizResponseSuccess extends QuizState {
  final QuizResponse quizResponse;
  QuizResponseSuccess(this.quizResponse);
}
