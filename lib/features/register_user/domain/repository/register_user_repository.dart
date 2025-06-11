import '../../../../imports.dart';

abstract class RegisterUserRepository {
  FutureEither<RegisterUserResponseModel> getRegisterUserData(
      RegisterUserRequestModel requestModel);

// FutureEither<RegisterUserCodeResponseModel> getUserCode(
//     RegisterUserResponseModel requestModel);
}
