import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

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
