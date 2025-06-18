import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'package:code_grapper/core/base_pages/base_page.dart';

mixin BasePageMixin implements BasePage {
  Widget _buildWidgetTree(BuildContext context) {
    if (appBar() == null && appbarWidget() != null) {
      return Column(
        children: <Widget>[
          appbarWidget()!,
          Expanded(
            child: body(context),
          ),
        ],
      );
    } else {
      return body(context);
    }
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: hasSideMenu()
          ? Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DrawerHeader(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withAlpha(20),
                    ),
                    child: showOnlyLogout() == true
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Admin!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.libreBaskerville().fontFamily,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.account_circle_outlined,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(Constants.chosenAdmin.email)
                                ],
                              )
                            ],
                          ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showOnlyLogout() == true
                            ? SizedBox()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.home_outlined),
                                    title: const Text('Home'),
                                    subtitle: const Text('Go to home page'),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                          Routes.adminHomeScreen,
                                          NavigationType.goNamed,
                                          context);

                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.app_registration_outlined),
                                    title: const Text('Register User'),
                                    subtitle: const Text('Register a new user'),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                          Routes.registerUserScreen,
                                          NavigationType.goNamed,
                                          context);
                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading:
                                        const Icon(Icons.perm_identity_rounded),
                                    title: const Text('Profile'),
                                    subtitle: const Text('Go to profile page'),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                          Routes.profileScreen,
                                          NavigationType.goNamed,
                                          context);
                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.login),
                                    title: const Text('Login'),
                                    subtitle:
                                        const Text('Login with other account'),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                          Routes.loginScreen,
                                          NavigationType.pushNamed,
                                          context,
                                          extra: LoginPageArgs(
                                              IsLoggingAgain: true));
                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.switch_account_outlined),
                                    title: const Text('Switch Account'),
                                    subtitle:
                                        const Text('Switch to another account'),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const SwitchAccountWidget();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                        ListTile(
                          leading: const Icon(Icons.logout_outlined),
                          title: const Text('Log Out'),
                          subtitle: const Text('Sign out of all your accounts'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomOkCancelDialog(
                                    onOkPressed: () async {
                                  await SecureStorageService.getInstance()
                                      .clear();
                                  Routes.clearStack();
                                  Routes.navigateToScreen(
                                      Routes.loginScreen,
                                      NavigationType.goNamed,
                                      context); // Closes the drawer
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: hasSideMenu() ? 100 : 0,
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      bottomSheet: bottomSheet(),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: containPadding() ? AppDimensions.screenPadding : 0,
        ),
        child: _buildWidgetTree(context),
      ),
    ));
  }
}
