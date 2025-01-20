
import 'package:fpdart/fpdart.dart';
import 'package:kwiz_app/core/error/failure.dart';

abstract interface class UseCase<SuccessType,Params>{
  Future<Either<Failure,SuccessType>>call(Params param);
}
class NoParams{}