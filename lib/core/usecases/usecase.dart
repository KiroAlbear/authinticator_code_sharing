import 'package:code_grapper/core/models/error_handling_models/failure.dart';
import 'package:code_grapper/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}
