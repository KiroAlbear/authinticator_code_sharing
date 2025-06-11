import '../../../../imports.dart';

abstract class ProfileRepository {
  FutureEither<ProfileResponseModel> getProfileData(
      ProfileRequestModel requestModel);

  FutureEither<ProfileResponseModel> updateProfile(
      UpdateProfileRequestModel requestModel);
}
