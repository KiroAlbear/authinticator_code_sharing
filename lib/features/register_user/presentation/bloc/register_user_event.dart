import 'package:code_grapper/features/register_user/data/models/update_user_request_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../imports.dart';

abstract class RegisterUserEvent extends Equatable {
  const RegisterUserEvent();

  @override
  List<Object> get props => <Object>[];
}

class registerUserEvent extends RegisterUserEvent {
  final RegisterUserRequestModel registerRequestModel;

  const registerUserEvent({required this.registerRequestModel});

  @override
  List<Object> get props => <Object>[registerRequestModel];
}

class updateUserEvent extends RegisterUserEvent {
  final UpdateUserRequestModel updateRequestModel;

  const updateUserEvent({required this.updateRequestModel});

  @override
  List<Object> get props => <Object>[updateRequestModel];
}
