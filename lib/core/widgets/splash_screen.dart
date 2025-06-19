import 'package:flutter/material.dart';

import '../../imports.dart';

class SplashScreen extends BaseStatefulPage {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    // Navigate to the next screen after a delay

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(milliseconds: 300), () {
      getChosenAdmin().then(
        (value) {
          Constants.chosenAdmin = value;
          if (value.email.isNotEmpty && value.password.isNotEmpty) {
            Routes.clearStack();
            Routes.navigateToScreen(
              Routes.adminHomeScreen,
              NavigationType.pushReplacementNamed,
              context,
            );
          } else {
            Routes.clearStack();
            Routes.navigateToScreen(
              Routes.loginScreen,
              NavigationType.pushReplacementNamed,
              context,
            );
          }
        },
      );
    });
    super.didChangeDependencies();
  }

  @override
  bool containPadding() => false;

  @override
  bool hasSocialMedia() => false;

  @override
  bool hasSideMenu() => false;

  @override
  PreferredSizeWidget? appBar() => null;

  @override
  Widget body(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 900,
        child: Center(
          child: Image.asset(
            Assets.images.png.logo.path,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
