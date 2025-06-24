import '../../../../imports.dart';

abstract class RegisterAdminRepository {
  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel);

  FutureEither<ApiResponseModel> sendEmail(String email);
}
