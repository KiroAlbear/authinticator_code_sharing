import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

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
