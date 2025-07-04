import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

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
