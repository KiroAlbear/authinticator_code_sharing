import '../../../../imports.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  FutureEither<ProfileResponseModel> getProfileData(
      ProfileRequestModel requestModel) {
    return _dataSource.getProfileData(requestModel);
  }

  @override
  FutureEither<ProfileResponseModel> updateProfile(
      UpdateProfileRequestModel requestModel) {
    return _dataSource.updateProfile(requestModel);
  }
}
