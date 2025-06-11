import '../../../../imports.dart';

abstract class LoginRepository {
  FutureEither<LoginResponseModel> login(LoginRequestModel requestModel);
}
