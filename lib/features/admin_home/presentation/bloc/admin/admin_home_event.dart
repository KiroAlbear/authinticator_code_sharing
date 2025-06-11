import 'package:code_grapper/features/admin_home/data/models/admin_home_request_model.dart';
import 'package:code_grapper/features/admin_home/data/models/delete_user_request_model.dart';
import 'package:code_grapper/features/admin_home/data/models/enable_disable_all_users_request_model.dart';
import 'package:code_grapper/features/admin_home/data/models/enable_disable_user_request_model.dart';
import 'package:code_grapper/features/admin_home/data/models/reset_user_request_model.dart';
import 'package:equatable/equatable.dart';

abstract class AdminHomeEvent extends Equatable {
  const AdminHomeEvent();

  @override
  List<Object> get props => <Object>[];
}

class getAdminHomeEvent extends AdminHomeEvent {
  final AdminHomeRequestModel requestModel;

  const getAdminHomeEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}

class enableDisableUserEvent extends AdminHomeEvent {
  final EnableDisableUserRequestModel requestModel;

  const enableDisableUserEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}

class enableDisableAllUsersEvent extends AdminHomeEvent {
  final EnableDisableAllUsersRequestModel requestModel;

  const enableDisableAllUsersEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}

class resetUserEvent extends AdminHomeEvent {
  final ResetUserRequestModel requestModel;

  const resetUserEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}

class deleteUserEvent extends AdminHomeEvent {
  final DeleteUserRequestModel requestModel;

  const deleteUserEvent({required this.requestModel});

  @override
  List<Object> get props => <Object>[requestModel];
}
