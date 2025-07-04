import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class RegisterUserUsecase
    extends UseCase<RegisterUserResponseModel, RegisterUserRequestModel> {
  final RegisterUserRepository repository;

  RegisterUserUsecase(this.repository);

  @override
  Future<Either<Failure, RegisterUserResponseModel>> call(
      RegisterUserRequestModel requestModel) async {
    return await repository.registerUser(requestModel);
  }
}
