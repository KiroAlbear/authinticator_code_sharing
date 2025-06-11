// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterUserStateCWProxy {
  RegisterUserState registerUserResponseModel(
      RegisterUserResponseModel? registerUserResponseModel);

  RegisterUserState savingStatus(Status savingStatus);

  RegisterUserState status(Status status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterUserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterUserState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterUserState call({
    RegisterUserResponseModel? registerUserResponseModel,
    Status? savingStatus,
    Status? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterUserState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterUserState.copyWith.fieldName(...)`
class _$RegisterUserStateCWProxyImpl implements _$RegisterUserStateCWProxy {
  const _$RegisterUserStateCWProxyImpl(this._value);

  final RegisterUserState _value;

  @override
  RegisterUserState registerUserResponseModel(
          RegisterUserResponseModel? registerUserResponseModel) =>
      this(registerUserResponseModel: registerUserResponseModel);

  @override
  RegisterUserState savingStatus(Status savingStatus) =>
      this(savingStatus: savingStatus);

  @override
  RegisterUserState status(Status status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterUserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterUserState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterUserState call({
    Object? registerUserResponseModel = const $CopyWithPlaceholder(),
    Object? savingStatus = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return RegisterUserState(
      registerUserResponseModel:
          registerUserResponseModel == const $CopyWithPlaceholder()
              ? _value.registerUserResponseModel
              // ignore: cast_nullable_to_non_nullable
              : registerUserResponseModel as RegisterUserResponseModel?,
      savingStatus:
          savingStatus == const $CopyWithPlaceholder() || savingStatus == null
              ? _value.savingStatus
              // ignore: cast_nullable_to_non_nullable
              : savingStatus as Status,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as Status,
    );
  }
}

extension $RegisterUserStateCopyWith on RegisterUserState {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterUserState.copyWith(...)` or like so:`instanceOfRegisterUserState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterUserStateCWProxy get copyWith =>
      _$RegisterUserStateCWProxyImpl(this);
}
