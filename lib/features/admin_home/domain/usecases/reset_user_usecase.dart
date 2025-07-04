import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

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
