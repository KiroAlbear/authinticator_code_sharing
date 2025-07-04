import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_bridge/imports.dart';

class RegisterAdminBloc extends Bloc<RegisterAdminEvent, RegisterAdminState> {
  final RegisterAdminUsecase registrationUsecase;
  final SendEmailUsecase sendEmailUsecase;

  RegisterAdminBloc({
    required this.registrationUsecase,
    required this.sendEmailUsecase,
  }) : super(RegisterAdminState()) {
    on<registerAdminEvent>(_getRegisterAdmin);
    on<sendEmailEvent>(_sendEmail);
  }

  FutureOr<void> _getRegisterAdmin(
      registerAdminEvent event, Emitter<ParentState> emit) async {
    emit(state.copyWith()
      ..status = Status.loading
      ..errorMessage = '');
    Either<Failure, ProfileResponseModel> result =
        await registrationUsecase(event.requestModel);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (ProfileResponseModel profileResponseModel) {
        emit(state.copyWith(
            profileResponseModel: profileResponseModel, isVerified: true)
          ..status = Status.success
          ..profileResponseModel = profileResponseModel);
      },
    );
  }

  FutureOr<void> _sendEmail(
      sendEmailEvent event, Emitter<RegisterAdminState> emit) async {
    emit(state.copyWith()
      ..status = Status.loading
      ..errorMessage = '');
    Either<Failure, ApiResponseModel> result =
        await sendEmailUsecase(event.email);

    result.fold(
      (failure) {
        emit(state.copyWith()
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (ApiResponseModel apiResponseModel) {
        emit(state.copyWith()..status = Status.success);
      },
    );
  }
}
