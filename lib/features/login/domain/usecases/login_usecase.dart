import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginRequestModel> {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(
      LoginRequestModel requestModel) async {
    return await repository.login(requestModel);
  }
}
