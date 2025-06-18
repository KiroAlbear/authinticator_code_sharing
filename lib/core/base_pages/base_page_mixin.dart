import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:code_grapper/core/base_pages/base_page.dart';

final double _socialIconSize = 28;
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          body(context),
          SizedBox(
            height: 180,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: _socialIconSize,
                        width: _socialIconSize,
                        child: GestureDetector(
                            onTap: () {
                              _openUrl(
                                  "https://www.facebook.com/profile.php?id=61572852771732");
                            },
                            child: SvgPicture.asset(
                                Assets.images.svg.facebookLogo))),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _openUrl(
                            "https://www.instagram.com/chathub.services?igsh=OG53cGZ5aWdyNnh6");
                      },
                      child: SizedBox(
                          height: _socialIconSize,
                          width: _socialIconSize,
                          child: SvgPicture.asset(
                              Assets.images.svg.instagramLogo)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                        height: _socialIconSize,
                        width: _socialIconSize,
                        child: GestureDetector(
                            onTap: () {
                              _openWhatsApp("+16892603417");
                            },
                            child: SvgPicture.asset(
                                Assets.images.svg.whatsappLogo))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Powered by",
                        style: GoogleFonts.libreBaskerville(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 3,
                    ),
                    Text("ChatHub Services",
                        style: GoogleFonts.libreBaskerville(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                                Assets.images.png.chathubLogo.path)))
                  ],
                )
              ],
            ),
          ),
        ],
      );
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

  Future<void> _openWhatsApp(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber");
    // if (await canLaunchUrl(whatsappUri))
    {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
    // else {
    //   throw Exception("Could not launch WhatsApp");
    // }
  }

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    // if (await canLaunchUrl(uri))
    {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
    // else {
    //   throw Exception("Could not launch Facebook");
    // }
  }
}
