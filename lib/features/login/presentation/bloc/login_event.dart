import 'package:code_grapper/features/login/data/models/login_request_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => <Object>[];
}

class getLoginEvent extends LoginEvent {
  final LoginRequestModel requestModel;

  const getLoginEvent(this.requestModel);

  @override
  List<Object> get props => <Object>[requestModel];
}
