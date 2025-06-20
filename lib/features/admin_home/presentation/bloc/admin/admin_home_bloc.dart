import 'dart:async';

import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  final AdminHomeUseCase adminHomeUseCase;
  final EnableDisableUserUseCase enableDisableUserUseCase;
  final EnableDisableAllUsersUseCase enableDisableAllUsersUseCase;
  final ResetUserUseCase resetUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  AdminHomeBloc(
      {required this.adminHomeUseCase,
      required this.enableDisableUserUseCase,
      required this.deleteUserUseCase,
      required this.enableDisableAllUsersUseCase,
      required this.resetUserUseCase})
      : super(AdminHomeState()) {
    on<getAdminHomeEvent>(_getAdminHome);
    on<enableDisableUserEvent>(_enableDisableUser);
    on<enableDisableAllUsersEvent>(_enableDisableAllUsers);
    on<resetUserEvent>(_resetUser);
    on<deleteUserEvent>(_deleteUser);
  }

  FutureOr<void> _getAdminHome(
      getAdminHomeEvent event, Emitter<ParentState> emit) async {
    emit(state.copyWith()
      ..status = Status.loading
      ..errorMessage = "");
    Either<Failure, AdminHomeResponseModel> result =
        await adminHomeUseCase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (AdminHomeResponseModel adminHomeResponseModel) {
        emit(state.copyWith(
            adminHomeResponseModel: adminHomeResponseModel,
            isChanged: !state.isChanged)
          ..status = adminHomeResponseModel.usersList.isEmpty
              ? Status.empty
              : Status.success);
      },
    );
  }

  FutureOr<void> _enableDisableUser(
      enableDisableUserEvent event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith()
      ..status = Status.success
      ..savingStatus = Status.loading);

    Either<Failure, UserResponseModel> result =
        await enableDisableUserUseCase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..savingStatus = Status.error
          ..status = Status.success
          ..errorMessage = failure.toErrorModel().message);
      },
      (UserResponseModel userResponseModel) {
        _updateUserList(userResponseModel);
        emit(state.copyWith()
          ..status = Status.success
          ..savingStatus = Status.success);
      },
    );
  }

  void _updateUserList(UserResponseModel userResponseModel) {
    for (var user in state.adminHomeResponseModel!.usersList) {
      if (user.userCode == userResponseModel.userCode) {
        user.expiryDate = userResponseModel.expiryDate;
        user.isMaximumCodesReached = userResponseModel.isMaximumCodesReached;
        user.loginCount = userResponseModel.loginCounter;
        user.isActive = userResponseModel.isActive;
        break;
      }
    }
  }

  FutureOr<void> _resetUser(
      resetUserEvent event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith()
      ..status = Status.success
      ..savingStatus = Status.loading);

    Either<Failure, UserResponseModel> result =
        await resetUserUseCase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..savingStatus = Status.error
          ..status = Status.success
          ..errorMessage = failure.toErrorModel().message);
      },
      (UserResponseModel userResponseModel) {
        _updateUserList(userResponseModel);
        emit(state.copyWith()
          ..status = Status.success
          ..savingStatus = Status.success);
      },
    );
  }

  FutureOr<void> _deleteUser(
      deleteUserEvent event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith()
      ..status = Status.success
      ..savingStatus = Status.loading);

    Either<Failure, AdminHomeResponseModel> result =
        await deleteUserUseCase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..savingStatus = Status.error
          ..status = Status.success
          ..errorMessage = failure.toErrorModel().message);
      },
      (AdminHomeResponseModel adminHomeResponseModel) {
        // _updateNewUserList(userResponseModel);
        emit(state.copyWith(
            adminHomeResponseModel: adminHomeResponseModel,
            isChanged: !state.isChanged)
          ..status = adminHomeResponseModel.usersList.isEmpty
              ? Status.empty
              : Status.success
          ..savingStatus = Status.success);
      },
    );
  }

  FutureOr<void> _enableDisableAllUsers(
      enableDisableAllUsersEvent event, Emitter<AdminHomeState> emit) async {
    emit(state.copyWith()
      ..status = Status.loading
      ..savingStatus = Status.loading);

    Either<Failure, AdminHomeResponseModel> result =
        await enableDisableAllUsersUseCase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..savingStatus = Status.error
          ..status = Status.success
          ..errorMessage = failure.toErrorModel().message);
      },
      (AdminHomeResponseModel adminHomeResponseModel) {
        emit(state.copyWith(
            adminHomeResponseModel: adminHomeResponseModel,
            isChanged: !state.isChanged)
          ..status = adminHomeResponseModel.usersList.isEmpty
              ? Status.empty
              : Status.success
          ..savingStatus = Status.success);
      },
    );
  }
}
