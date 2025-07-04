import 'package:key_bridge/features/register_user/data/models/update_user_request_model.dart';

import '../../../../imports.dart';

abstract class RegisterUserRepository {
  FutureEither<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel requestModel);

  FutureEither<RegisterUserResponseModel> updateUser(
      UpdateUserRequestModel requestModel);
}
