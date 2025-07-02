import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

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
