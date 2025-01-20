import 'package:fpdart/src/either.dart';
import 'package:kwiz_app/core/error/exception.dart';
import 'package:kwiz_app/core/error/failure.dart';
import 'package:kwiz_app/feature/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/repository/quiz_repository.dart';

class QuizRepositoryImp implements QuizRepository{
  final QuizRemoteDataSource quizRemoteDataSource;

  QuizRepositoryImp(this.quizRemoteDataSource);
  @override
  Future<Either<Failure, Quiz>> getQuiz()async{
    try {
      final quiz = await quizRemoteDataSource.getQuiz();
      return right(quiz);
    } on ServerException catch (e) {
     return left(Failure(e.message));
   }
  }

}