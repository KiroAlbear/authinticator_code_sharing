import 'package:key_bridge/imports.dart';

abstract class ProfileRemoteDataSource {
  FutureEither<ProfileResponseModel> getProfileData(
      ProfileRequestModel requestModel);

  FutureEither<ProfileResponseModel> updateProfile(
      UpdateProfileRequestModel requestModel);
}

class ProfileDataRemoteDataSourceImpl extends ApiHelper
    implements ProfileRemoteDataSource {
  @override
  FutureEither<ProfileResponseModel> updateProfile(
      UpdateProfileRequestModel requestModel) {
    return postData<ProfileResponseModel>(
      Urls.updateAdmin,
      body: requestModel.toJson(),
      responseConverter: ProfileResponseModel.fromJson,
    );
  }

  @override
  FutureEither<ProfileResponseModel> getProfileData(
      ProfileRequestModel requestModel) {
    return postData<ProfileResponseModel>(
      Urls.getAdminProfileData,
      body: requestModel.toJson(),
      responseConverter: ProfileResponseModel.fromJson,
    );
  }
}
