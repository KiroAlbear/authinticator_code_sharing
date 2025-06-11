import 'dart:async';

import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAdminBloc extends Bloc<RegisterAdminEvent, RegisterAdminState> {
  final RegisterAdminUsecase registrationUsecase;

  RegisterAdminBloc({required this.registrationUsecase})
      : super(RegisterAdminState()) {
    on<registerAdminEvent>(_getRegisterAdmin);
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
        emit(state.copyWith(profileResponseModel: profileResponseModel)
          ..status = Status.success
          ..profileResponseModel = profileResponseModel);
      },
    );
  }
}
