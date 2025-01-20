import 'package:get_it/get_it.dart';
import 'package:kwiz_app/feature/quiz/data/datasource/quiz_remote_data_source.dart';
import 'package:kwiz_app/feature/quiz/data/repository/quiz_repository_imp.dart';
import 'package:kwiz_app/feature/quiz/domain/repository/quiz_repository.dart';
import 'package:kwiz_app/feature/quiz/domain/usecases/get_quiz.dart';
import 'package:kwiz_app/feature/quiz/presentation/bloc/quiz_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initQuiz();
}

void _initQuiz() {
  //dataSource
  serviceLocator
    ..registerFactory<QuizRemoteDataSource>(
      () => QuizRemoteDataSourceImp(),
    )
    //repository
    ..registerFactory<QuizRepository>(
      () => QuizRepositoryImp(
        serviceLocator(),
      ),
    )
    //usecase
    ..registerFactory(
      () => GetQuiz(
        serviceLocator(),
      ),
    )
    //bloc
    ..registerFactory(
      () => QuizBloc(
        getQuiz: serviceLocator(),
      ),
    );
}
