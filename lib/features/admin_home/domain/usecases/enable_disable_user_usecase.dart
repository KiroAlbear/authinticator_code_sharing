import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class EnableDisableUserUseCase
    extends UseCase<UserResponseModel, EnableDisableUserRequestModel> {
  final AdminHomeRepository repository;

  EnableDisableUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserResponseModel>> call(
      EnableDisableUserRequestModel requestModel) async {
    return await repository.enableDisableUser(requestModel);
  }
}
