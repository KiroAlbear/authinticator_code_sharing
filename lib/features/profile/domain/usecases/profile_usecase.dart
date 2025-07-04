import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class ProfileUsecase
    extends UseCase<ProfileResponseModel, ProfileRequestModel> {
  final ProfileRepository repository;

  ProfileUsecase(this.repository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(
      ProfileRequestModel requestModel) async {
    return await repository.getProfileData(requestModel);
  }
}
