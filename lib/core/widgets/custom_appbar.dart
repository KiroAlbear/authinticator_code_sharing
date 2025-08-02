import 'package:flutter/material.dart';
import 'package:key_bridge/imports.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? hasBackButton;
  final double _iconSize = 20;

  const CustomAppbar(
      {super.key, required this.title, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: EasyLocalization.of(context)!.currentLocale == Locale('en')
              ? [
                  Colors.white,
                  Colors.white.withOpacity(0.3),
                  Colors.transparent
                ]
              : [
                  Colors.transparent,
                  Colors.white.withOpacity(0.3),
                  Colors.white,
                ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.3, 0.4, 1],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (hasBackButton == null)
              ? SizedBox(width: 8)
              : SizedBox(
                  width: 0,
                ),
          hasBackButton == null
              ? const SizedBox()
              : hasBackButton!
                  ? IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: _iconSize,
                      ),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                    )
                  : IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        Icons.menu,
                        size: _iconSize,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
          // const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 3,
                ),
                SizedBox(
                    width: 70, child: Image.asset(Assets.images.png.logo.path)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // language switcher
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.language),
                        onSelected: (value) {
                          if (value ==
                              SharedPrefrencesKeys.englishLanguageKey) {
                            EasyLocalization.of(context)!.setLocale(
                                const Locale(
                                    SharedPrefrencesKeys.englishLanguageKey));
                            SharedPrefrencesService.getInstance().setString(
                              SharedPrefrencesKeys.languageKey,
                              SharedPrefrencesKeys.englishLanguageKey,
                            );
                          } else if (value ==
                              SharedPrefrencesKeys.arabicLanguageKey) {
                            EasyLocalization.of(context)!.setLocale(
                                const Locale(
                                    SharedPrefrencesKeys.arabicLanguageKey));

                            SharedPrefrencesService.getInstance().setString(
                              SharedPrefrencesKeys.languageKey,
                              SharedPrefrencesKeys.arabicLanguageKey,
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'en',
                            child: Row(
                              children: const [
                                Text('🇺🇸'),
                                SizedBox(width: 8),
                                Text('English'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'ar',
                            child: Row(
                              children: const [
                                Text('🇪🇬'),
                                SizedBox(width: 8),
                                Text('العربية'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
