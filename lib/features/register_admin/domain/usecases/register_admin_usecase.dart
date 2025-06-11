import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class RegisterAdminUsecase
    extends UseCase<ProfileResponseModel, RegisterAdminRequestModel> {
  final RegisterAdminRepository repository;

  RegisterAdminUsecase(this.repository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(
      RegisterAdminRequestModel requestModel) async {
    return await repository.registerAdmin(requestModel);
  }
}
