import 'package:fpdart/fpdart.dart';
import 'package:kwiz_app/core/error/failure.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';

abstract class QuizRepository {
  Future<Either<Failure,Quiz>> getQuiz();
}