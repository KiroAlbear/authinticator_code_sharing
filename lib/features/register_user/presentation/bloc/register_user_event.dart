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
