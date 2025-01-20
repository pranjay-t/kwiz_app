import 'package:fpdart/fpdart.dart';
import 'package:kwiz_app/core/error/failure.dart';
import 'package:kwiz_app/core/usecase/usecase.dart';
import 'package:kwiz_app/feature/quiz/domain/entities/quiz.dart';
import 'package:kwiz_app/feature/quiz/domain/repository/quiz_repository.dart';

class GetQuiz implements UseCase<Quiz,NoParams>{
  final QuizRepository quizRepository;
  GetQuiz(this.quizRepository);

  @override
  Future<Either<Failure, Quiz>> call(NoParams param)async{
    return await quizRepository.getQuiz();
  }

}