import 'package:dartz/dartz.dart';
import 'package:key_bridge/features/register_user/data/models/update_user_request_model.dart';
import 'package:key_bridge/imports.dart';

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
