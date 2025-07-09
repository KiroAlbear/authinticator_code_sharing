import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'imports.dart';

void main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn =
      'https://c4476861b52959c375799b3dc7b924c5@o4509616183705600.ingest.us.sentry.io/4509616185278464';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      await DependencyInjectionService().init();
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await SharedPrefrencesService.init();

      runApp(SentryWidget(
          child: EasyLocalization(
              supportedLocales: [
                Locale(SharedPrefrencesKeys.arabicLanguageKey),
                Locale(SharedPrefrencesKeys.englishLanguageKey)
              ],
              path: 'assets/translations',
              fallbackLocale: Locale(SharedPrefrencesKeys.englishLanguageKey),
              child: const MyApp())));
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        final String language = SharedPrefrencesService.getInstance()
            .getString(SharedPrefrencesKeys.languageKey) ??
            SharedPrefrencesKeys.englishLanguageKey;

        EasyLocalization.of(context)!.setLocale(Locale(language));
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MultiBlocProvider(
            providers: ProvidersService().getAppProviders(context),
            child: MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: Routes.goRouter,
              title: 'Key Bridge',
              theme: appTheme(ThemeMode.light, context),
            ),
          )),
    );
  }
}
