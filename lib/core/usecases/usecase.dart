import 'package:dartz/dartz.dart';
import 'package:key_bridge/core/models/error_handling_models/failure.dart';
import 'package:key_bridge/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}
