import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static BuildContext? buildContext;

  Routes._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String mainScreen = '/';
  static const String loginScreen = '/login';
  static const String registerAdminScreen = '/registerAdminScreen';
  static const String forgetPasswordScreen = '/forget_password';
  static const String profileScreen = '/profile';
  static const String codeScreen = '/code';
  static const String adminHomeScreen = '/admingHome';
  static const String registerUserScreen = '/registerUserScreen';

  static final GoRouter goRouter = GoRouter(
    observers: [],
    initialLocation: registerAdminScreen,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: mainScreen,
        name: mainScreen,
        pageBuilder: (context, state) =>
            _fadeTransitionScreenWrapper(context, state, TestFeaturePage()),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: loginScreen,
        name: loginScreen,
        pageBuilder: (context, state) {
          final LoginPageArgs? args = state.extra is LoginPageArgs
              ? state.extra as LoginPageArgs
              : null;
          return _fadeTransitionScreenWrapper(
              context,
              state,
              BlocProvider(
                  create: (context) => LoginBloc(
                        loginUsecase: getIt<LoginUsecase>(),
                      ),
                  child: LoginPage(
                    args: args,
                  )));
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: registerAdminScreen,
        name: registerAdminScreen,
        pageBuilder: (context, state) => _fadeTransitionScreenWrapper(
            context,
            state,
            BlocProvider(
                create: (context) => RegisterAdminBloc(
                      registrationUsecase: getIt<RegisterAdminUsecase>(),
                    ),
                child: RegisterAdminPage())),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: profileScreen,
        name: profileScreen,
        pageBuilder: (context, state) => _fadeTransitionScreenWrapper(
            context,
            state,
            BlocProvider(
                create: (context) => ProfileBloc(
                      profileUsecase: getIt<ProfileUsecase>(),
                      updateProfileUsecase: getIt<UpdateProfileUsecase>(),
                    ),
                child: ProfilePage())),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: registerUserScreen,
        name: registerUserScreen,
        pageBuilder: (context, state) => _fadeTransitionScreenWrapper(
            context,
            state,
            BlocProvider(
                create: (context) => RegisterUserBloc(
                      registerUserUsecase: getIt<RegisterUserUsecase>(),
                    ),
                child: RegisterUserPage())),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: codeScreen,
        name: codeScreen,
        pageBuilder: (context, state) {
          return _fadeTransitionScreenWrapper(context, state, CodePage());
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: adminHomeScreen,
        name: adminHomeScreen,
        pageBuilder: (context, state) {
          return _fadeTransitionScreenWrapper(
              context,
              state,
              BlocProvider(
                  create: (context) => AdminHomeBloc(
                        adminHomeUseCase: getIt<AdminHomeUseCase>(),
                        enableDisableUserUseCase:
                            getIt<EnableDisableUserUseCase>(),
                        resetUserUseCase: getIt<ResetUserUseCase>(),
                        deleteUserUseCase: getIt<DeleteUserUseCase>(),
                        enableDisableAllUsersUseCase:
                            getIt<EnableDisableAllUsersUseCase>(),
                      ),
                  child: AdminHomePage()));
        },
      ),
    ],
  );

  static void navigateToScreen(
    String screenName,
    NavigationType navigateType,
    BuildContext context, {
    Map<String, String>? queryParameters,
    Object? extra,
  }) async {
    switch (navigateType) {
      case NavigationType.pushNamed:
        GoRouter.of(context).pushNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      case NavigationType.goNamed:
        GoRouter.of(context).goNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      case NavigationType.pushReplacementNamed:
        GoRouter.of(context).pushReplacementNamed(screenName,
            queryParameters: queryParameters ?? {}, extra: extra);
        break;

      default:
        GoRouter.of(context)
            .goNamed(screenName, queryParameters: queryParameters ?? {});
        break;
    }
  }

  static void clearStack() {
    while (Navigator.canPop(rootNavigatorKey.currentContext!)) {
      Navigator.of(rootNavigatorKey.currentContext!).pop();
    }
  }

  static void navigateToFirstScreen(context) {
    while (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  static CustomTransitionPage<dynamic> _fadeTransitionScreenWrapper(
      BuildContext context, dynamic state, Widget screen) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.linear).animate(animation),
          child: child,
        );
      },
      key: state.pageKey,
      child: screen,
    );
  }
}
