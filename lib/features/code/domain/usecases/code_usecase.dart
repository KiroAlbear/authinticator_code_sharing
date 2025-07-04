import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class CodeUsecase extends UseCase<CodeResponseModel, CodeUsecaseParams> {
  final CodeRepository repository;

  CodeUsecase(this.repository);

  @override
  Future<Either<Failure, CodeResponseModel>> call(
      CodeUsecaseParams params) async {
    return await repository.requestCode(params.requestModel);
  }
}

class CodeUsecaseParams {
  final CodeRequestModel requestModel;

  CodeUsecaseParams(this.requestModel);
}
