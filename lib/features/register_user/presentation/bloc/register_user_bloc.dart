import 'dart:async';

import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final RegisterUserUsecase registerUserUsecase;

  RegisterUserBloc({
    required this.registerUserUsecase,
  }) : super(RegisterUserState()) {
    on<registerUserEvent>(_registerUser);
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
}
