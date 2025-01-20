import 'dart:convert';
import 'package:kwiz_app/secret.dart';
import 'package:kwiz_app/core/error/exception.dart';
import 'package:kwiz_app/feature/quiz/data/model/quiz_model.dart';
import 'package:http/http.dart' as http;

abstract interface class QuizRemoteDataSource {
  Future<QuizModel> getQuiz();
}

class QuizRemoteDataSourceImp implements QuizRemoteDataSource{
  @override
  Future<QuizModel> getQuiz()async{
    try {
      final response = await http.get(Uri.parse(Secret.apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        QuizModel quiz = QuizModel.fromJson(jsonData);
        return quiz;
      } else {
        throw ServerException('Failed to load quiz');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}