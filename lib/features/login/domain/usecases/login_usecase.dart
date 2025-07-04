import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class LoginUsecase extends UseCase<LoginResponseModel, LoginRequestModel> {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(
      LoginRequestModel requestModel) async {
    return await repository.login(requestModel);
  }
}
