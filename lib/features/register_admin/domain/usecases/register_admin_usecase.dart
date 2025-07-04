import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

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
