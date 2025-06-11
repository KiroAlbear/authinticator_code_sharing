import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class AdminHomeUseCase
    extends UseCase<AdminHomeResponseModel, AdminHomeRequestModel> {
  final AdminHomeRepository repository;

  AdminHomeUseCase(this.repository);

  @override
  Future<Either<Failure, AdminHomeResponseModel>> call(
      AdminHomeRequestModel requestModel) async {
    return await repository.getAdminHomeData(requestModel);
  }
}
