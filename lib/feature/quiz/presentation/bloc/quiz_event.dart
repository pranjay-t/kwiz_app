part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

final class GetQuizEvent extends QuizEvent {}

final class QuizResponseEvent extends QuizEvent {
  final Quiz quiz;
  final List<int?> selectedAnswers;

  QuizResponseEvent({
    required this.quiz,
    required this.selectedAnswers,
  });
}
