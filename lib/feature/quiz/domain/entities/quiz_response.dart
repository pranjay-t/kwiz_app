class QuizResponse {
  final int score;
  final List<int?> correctIndexes ;
  final List<int?> incorrectIndexes;
  final List<int?> notAttemptedIndexes;
  final List<int?> selectedAnswers;

  QuizResponse({
    required this.score,
    required this.correctIndexes,
    required this.incorrectIndexes,
    required this.notAttemptedIndexes,
    required this.selectedAnswers,
  });
  
}