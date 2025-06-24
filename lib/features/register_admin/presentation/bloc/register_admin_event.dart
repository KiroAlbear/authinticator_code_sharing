import 'package:equatable/equatable.dart';

import '../../../../imports.dart';

abstract class RegisterAdminEvent extends Equatable {
  const RegisterAdminEvent();

  @override
  List<Object> get props => <Object>[];
}

class registerAdminEvent extends RegisterAdminEvent {
  final RegisterAdminRequestModel requestModel;

  const registerAdminEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}

class sendEmailEvent extends RegisterAdminEvent {
  final String email;

  const sendEmailEvent({required this.email});

  @override
  List<Object> get props => <Object>[email];
}
