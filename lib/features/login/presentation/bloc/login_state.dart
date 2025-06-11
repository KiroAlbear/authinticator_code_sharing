import 'package:code_grapper/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState extends ParentState {
  LoginResponseModel? loginResponseModel;
  bool isChanged;

  LoginState({this.loginResponseModel, this.isChanged = false}) : super() {
    status = Status.success;
    errorMessage = '';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.loginResponseModel == loginResponseModel &&
        other.isChanged == isChanged;
  }

  @override
  List<Object?> get props => [loginResponseModel, isChanged];
}
