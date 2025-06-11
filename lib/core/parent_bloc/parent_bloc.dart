import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../imports.dart';

class ParentBloc<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget? Function(S) builder;
  final bool Function(S, S)? buildWhen;
  final bool Function(S, S)? listenWhen;
  final Function(BuildContext context, S state)? listenerFunction;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final showWidgetOnError;

  ParentBloc({
    Key? key,
    required this.builder,
    this.showWidgetOnError = false,
    this.listenerFunction,
    this.buildWhen,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.listenWhen,
  }) : super(key: key);

  Widget _buildMainWidget(BuildContext context, S state) {
    if ((state as ParentState).status == Status.initial) {
      return loadingWidget ?? const AppLoadingBar();
    } else if (((state as ParentState).status == Status.loading)) {
      return loadingWidget ??
          Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: StaticColors.primaryColor, size: 50));
    } else if ((state as ParentState).status == Status.empty) {
      return emptyWidget ?? const NoDataErrorWidget();
    } else if ((state as ParentState).status == Status.error &&
        showWidgetOnError) {
      return builder(state) ?? const SizedBox();
    } else if ((state as ParentState).status == Status.error) {
      return errorWidget ?? const ServerErrorWidget();
    } else if ((state as ParentState).status == Status.success) {
      return builder(state) ?? const SizedBox();
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listenWhen: (S previous, S current) {
        if (listenWhen == null) {
          return previous != current;
        } else {
          return listenWhen!(previous, current);
        }
      },
      buildWhen: (S previous, S current) {
        if (buildWhen == null) {
          return previous != current;
        } else {
          return buildWhen!(previous, current);
        }
      },
      listener: (BuildContext context, S state) {
        if (listenerFunction != null) listenerFunction!(context, state);
        if ((state as ParentState).status == Status.error) {
          AppToast.showToast(
            state.errorMessage,
            context: context,
            type: AppToastType.error,
          );
        }
        if ((state as ParentState).status == Status.success &&
            state.successMessage.isNotEmpty) {
          AppToast.showToast(
            state.successMessage,
            context: context,
            type: AppToastType.success,
          );
        }
      },
      builder: (BuildContext context, S state) {
        return _buildMainWidget(context, state);
      },
    );
  }
}
