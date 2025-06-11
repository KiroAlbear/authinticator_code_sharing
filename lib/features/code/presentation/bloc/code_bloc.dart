import 'dart:async';

import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  final CodeUsecase codeUsecase;

  CodeBloc({required this.codeUsecase}) : super(CodeState()) {
    on<requestCodeEvent>(_getCode);
  }

  FutureOr<void> _getCode(
      requestCodeEvent event, Emitter<ParentState> emit) async {
    emit(state.copyWith()..status = Status.loading);

    Either<Failure, CodeResponseModel> result =
        await codeUsecase(CodeUsecaseParams(
      CodeRequestModel(
        email: event.email,
        userCode: event.userCode,
      ),
    ));

    result.fold(
      (Failure failure) {
        emit(state.copyWith()
          ..errorMessage = failure.toErrorModel().message
          ..status = Status.error);
      },
      (CodeResponseModel codeData) {
        emit(state.copyWith(codeData: codeData)..status = Status.success);
      },
    );
  }
}
