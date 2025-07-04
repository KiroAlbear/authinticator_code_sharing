import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class EnableDisableAllUsersUseCase
    extends UseCase<AdminHomeResponseModel, EnableDisableAllUsersRequestModel> {
  final AdminHomeRepository repository;

  EnableDisableAllUsersUseCase(this.repository);

  @override
  Future<Either<Failure, AdminHomeResponseModel>> call(
      EnableDisableAllUsersRequestModel requestModel) async {
    return await repository.enableDisableAllUsers(requestModel);
  }
}
