import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

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
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.3),
            Colors.transparent
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.3, 0.4, 1],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
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
