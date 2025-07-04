import 'package:key_bridge/imports.dart';
import 'package:dartz/dartz.dart';

class DeleteUserUseCase
    extends UseCase<AdminHomeResponseModel, DeleteUserRequestModel> {
  final AdminHomeRepository repository;

  DeleteUserUseCase(this.repository);

  @override
  Future<Either<Failure, AdminHomeResponseModel>> call(
      DeleteUserRequestModel requestModel) async {
    return await repository.deleteUser(requestModel);
  }
}
