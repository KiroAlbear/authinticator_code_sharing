import 'dart:async';

import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase profileUsecase;
  final UpdateProfileUsecase updateProfileUsecase;

  ProfileBloc({
    required this.profileUsecase,
    required this.updateProfileUsecase,
  }) : super(ProfileState()) {
    on<getProfileEvent>(_getProfile);
    on<updateProfileEvent>(_updateProfile);
  }

  FutureOr<void> _getProfile(
      getProfileEvent event, Emitter<ParentState> emit) async {
    emit(state.copyWith(savingStatus: Status.loading)..status = Status.loading);

    Either<Failure, ProfileResponseModel> result =
        await profileUsecase(event.profileRequestModel);

    result.fold(
      (failure) {
        emit(state.copyWith(savingStatus: Status.error)
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (ProfileResponseModel profileData) {
        emit(state.copyWith(profileResponseModel: profileData)
          ..savingStatus = Status.success
          ..status = Status.success);
      },
    );
  }

  FutureOr<void> _updateProfile(
      updateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(savingStatus: Status.loading));

    Either<Failure, ProfileResponseModel> result =
        await updateProfileUsecase(event.updateAdminRequestModel);

    result.fold(
      (failure) {
        emit(state
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (ProfileResponseModel profileData) {
        emit(state.copyWith(profileResponseModel: profileData)
          ..successMessage = "Data updated successfully"
          ..status = Status.success);
      },
    );
  }
}
