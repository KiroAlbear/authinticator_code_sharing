import 'dart:async';

import 'package:code_grapper/features/register_user/domain/usecases/update_user_usecase.dart';
import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUserUsecase registerUserUsecase;
  final UpdateUserUsecase updateUserUsecase;

  RegisterUserBloc({
    required this.registerUserUsecase,
    required this.updateUserUsecase,
  }) : super(RegisterUserState()) {
    on<registerUserEvent>(_registerUser);
    on<updateUserEvent>(_updateUser);
  }

  FutureOr<void> _registerUser(
      registerUserEvent event, Emitter<ParentState> emit) async {
    emit(state.copyWith(savingStatus: Status.loading)..status = Status.loading);

    Either<Failure, RegisterUserResponseModel> result =
        await registerUserUsecase(event.registerRequestModel);

    result.fold(
      (failure) {
        emit(state.copyWith(savingStatus: Status.error)
          ..status = Status.error
          ..savingStatus = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (RegisterUserResponseModel profileData) {
        emit(state.copyWith(registerUserResponseModel: profileData)
          ..successMessage = "User registered successfully"
          ..savingStatus = Status.success
          ..status = Status.success);
      },
    );
  }

  FutureOr<void> _updateUser(
      updateUserEvent event, Emitter<RegisterUserState> emit) async {
    emit(state.copyWith(savingStatus: Status.loading)..status = Status.loading);

    Either<Failure, RegisterUserResponseModel> result =
        await updateUserUsecase(event.updateRequestModel);

    result.fold(
      (failure) {
        emit(state.copyWith(savingStatus: Status.error)
          ..status = Status.error
          ..savingStatus = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (RegisterUserResponseModel profileData) {
        emit(state.copyWith(registerUserResponseModel: profileData)
          ..successMessage = "User updated successfully"
          ..savingStatus = Status.success
          ..status = Status.success);
      },
    );
  }
}
