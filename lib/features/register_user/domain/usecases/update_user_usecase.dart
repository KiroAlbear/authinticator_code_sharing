import 'package:code_grapper/features/register_user/data/models/update_user_request_model.dart';
import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class UpdateUserUsecase
    extends UseCase<RegisterUserResponseModel, UpdateUserRequestModel> {
  final RegisterUserRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, RegisterUserResponseModel>> call(
      UpdateUserRequestModel requestModel) async {
    return await repository.updateUser(requestModel);
  }
}
