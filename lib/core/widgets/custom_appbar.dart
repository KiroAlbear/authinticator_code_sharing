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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(90),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 2),
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
