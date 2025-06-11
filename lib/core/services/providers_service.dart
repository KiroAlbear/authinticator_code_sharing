import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersService {
  List<BlocProvider> getAppProviders(BuildContext context) {
    return [
      BlocProvider<CodeBloc>(
        create: (context) => CodeBloc(
          codeUsecase: getIt<CodeUsecase>(),
        ),
      ),
    ];
  }
}
