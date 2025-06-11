import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class ResetUserUseCase
    extends UseCase<UserResponseModel, ResetUserRequestModel> {
  final AdminHomeRepository repository;

  ResetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserResponseModel>> call(
      ResetUserRequestModel requestModel) async {
    return await repository.resetUser(requestModel);
  }
}
