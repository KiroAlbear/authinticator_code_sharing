import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class TestFeatureUsecase extends UseCase<ApiResponseModel, NoParams> {
  final TestFeatureRepository repository;

  TestFeatureUsecase(this.repository);

  @override
  Future<Either<Failure, ApiResponseModel>> call(NoParams params) async {
    return await repository.getTestFeatureData();
  }
}
