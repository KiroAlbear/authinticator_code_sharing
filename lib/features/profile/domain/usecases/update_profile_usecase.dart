import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUsecase
    extends UseCase<ProfileResponseModel, UpdateProfileRequestModel> {
  final ProfileRepository repository;

  UpdateProfileUsecase(this.repository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(
      UpdateProfileRequestModel requestModel) async {
    return await repository.updateProfile(requestModel);
  }
}
