import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_bridge/imports.dart';

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
