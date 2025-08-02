import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_bridge/core/widgets/drawer_widget.dart';
import 'package:key_bridge/imports.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:key_bridge/core/base_pages/base_page.dart';

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
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MediaQuery.of(context).size.width > AppDimensions.mobileScreenWidth &&
                  hasSideMenu()
              ? Flexible(
                  flex: 1,
                  child: DrawerWidget(showOnlyLogout: showOnlyLogout()))
              : SizedBox(),
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
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
                                            await _openWhatsApp(
                                                "+201505940668");
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
                                  Text(
                                      EasyLocalization.of(context)
                                                  ?.currentLocale! ==
                                              Locale("en")
                                          ? "Powered by"
                                          : "ChatHub Services",
                                      style: GoogleFonts.libreBaskerville(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                      EasyLocalization.of(context)
                                                  ?.currentLocale! ==
                                              Locale("en")
                                          ? "ChatHub Services"
                                          : "Powered by",
                                      style: GoogleFonts.libreBaskerville(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                          child: Image.asset(Assets
                                              .images.png.chathubLogo.path)))
                                ],
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: (MediaQuery.of(context).size.width <=
                  AppDimensions.mobileScreenWidth &&
              hasSideMenu())
          ? Drawer(
              backgroundColor: StaticColors.sideMenuColor,
              child: DrawerWidget(
                showOnlyLogout: showOnlyLogout(),
                isSideMenu: true,
              ),
            )
          : null,
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
