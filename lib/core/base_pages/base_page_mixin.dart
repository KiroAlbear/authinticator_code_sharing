import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:code_grapper/core/base_pages/base_page.dart';

final double _socialIconSize = 28;
final String version =
    const String.fromEnvironment('APP_VERSION', defaultValue: 'v1.0.0');
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
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            body(context),
            SizedBox(
              height: 10,
            ),
            hasSocialMedia()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: _socialIconSize,
                                width: _socialIconSize,
                                child: GestureDetector(
                                    onTap: () async {
                                      await _openUrl(
                                          "https://www.facebook.com/profile.php?id=61572852771732");
                                    },
                                    child: SvgPicture.asset(
                                        Assets.images.svg.facebookLogo))),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () async {
                                _openUrl(
                                    await "https://www.instagram.com/chathub.services?igsh=OG53cGZ5aWdyNnh6");
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
                                    onTap: () async {
                                      await _openWhatsApp("+201505940668");
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
                  )
                : SizedBox(),
          ],
        ),
      );
    }
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: hasSideMenu()
          ? Drawer(
              backgroundColor: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DrawerHeader(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Color(0xFFEDE7F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 1.0],
                      ),
                    ),
                    child: showOnlyLogout() == true
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.Welcome_Admin.tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
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
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    Constants.chosenAdmin.email,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
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
                                    title: Text(LocaleKeys.home.tr()),
                                    subtitle:
                                        Text(LocaleKeys.Go_to_home_page.tr()),
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
                                    title: Text(LocaleKeys.add_user.tr()),
                                    subtitle:
                                        Text(LocaleKeys.Add_new_user.tr()),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                              Routes.registerUserScreen,
                                              NavigationType.pushNamed,
                                              context)
                                          .then(
                                        (value) {
                                          BlocProvider.of<AdminHomeBloc>(
                                                  context)
                                              .add(getAdminHomeEvent(
                                            requestModel: AdminHomeRequestModel(
                                              email:
                                                  Constants.chosenAdmin.email,
                                              password: Constants
                                                  .chosenAdmin.password,
                                            ),
                                          ));
                                        },
                                      );
                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading:
                                        const Icon(Icons.perm_identity_rounded),
                                    title: Text(LocaleKeys.profile.tr()),
                                    subtitle: Text(
                                        LocaleKeys.Go_to_profile_page.tr()),
                                    onTap: () {
                                      Routes.navigateToScreen(
                                          Routes.profileScreen,
                                          NavigationType.pushNamed,
                                          context);
                                      Navigator.pop(
                                          context); // Closes the drawer
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.login),
                                    title: Text(LocaleKeys.login.tr()),
                                    subtitle: Text(LocaleKeys
                                        .Login_with_other_account.tr()),
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
                                    title: Text(LocaleKeys.Switch_Account.tr()),
                                    subtitle: Text(LocaleKeys
                                        .Switch_to_another_account.tr()),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const SwitchAccountWidget();
                                        },
                                      );
                                    },
                                  ),
                                  Divider(),
                                ],
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.logout_outlined),
                              title: Text(LocaleKeys.Log_Out.tr()),
                              subtitle: Text(LocaleKeys
                                  .Sign_out_of_all_your_accounts.tr()),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 12, 3),
                              child: Text(
                                version,
                                style: GoogleFonts.libreBaskerville(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
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
