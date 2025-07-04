import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_bridge/imports.dart';

class TestFeatureBloc extends Bloc<TestFeatureEvent, TestFeatureState> {
  final TestFeatureUsecase testFeatureUsecase;

  TestFeatureBloc(
    this.testFeatureUsecase,
  ) : super(TestFeatureState()) {
    on<getTestFeatureEvent>(_getTestFeature);
  }

  FutureOr<void> _getTestFeature(
      getTestFeatureEvent event, Emitter<ParentState> emit) async {
    Either<Failure, ApiResponseModel> result =
        await testFeatureUsecase(NoParams());

    result.fold(
      (failure) {
        emit(state
          ..status = Status.error
          ..errorMessage = failure.toErrorModel().message);
      },
      (ApiResponseModel testFeatureData) {},
    );
  }
}
