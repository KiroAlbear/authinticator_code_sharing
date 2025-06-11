// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState loginResponseModel(LoginResponseModel? loginResponseModel);

  LoginState isChanged(bool isChanged);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    LoginResponseModel? loginResponseModel,
    bool? isChanged,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState loginResponseModel(LoginResponseModel? loginResponseModel) =>
      this(loginResponseModel: loginResponseModel);

  @override
  LoginState isChanged(bool isChanged) => this(isChanged: isChanged);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? loginResponseModel = const $CopyWithPlaceholder(),
    Object? isChanged = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
      loginResponseModel: loginResponseModel == const $CopyWithPlaceholder()
          ? _value.loginResponseModel
          // ignore: cast_nullable_to_non_nullable
          : loginResponseModel as LoginResponseModel?,
      isChanged: isChanged == const $CopyWithPlaceholder() || isChanged == null
          ? _value.isChanged
          // ignore: cast_nullable_to_non_nullable
          : isChanged as bool,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
