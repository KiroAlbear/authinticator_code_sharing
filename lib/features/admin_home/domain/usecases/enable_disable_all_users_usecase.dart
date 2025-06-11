import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

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
