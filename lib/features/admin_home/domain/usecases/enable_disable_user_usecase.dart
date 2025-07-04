import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

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
