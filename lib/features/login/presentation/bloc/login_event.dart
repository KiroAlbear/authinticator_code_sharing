import 'package:equatable/equatable.dart';
import 'package:key_bridge/features/login/data/models/login_request_model.dart';

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
