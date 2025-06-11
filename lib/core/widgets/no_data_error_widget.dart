import 'package:flutter/material.dart';

import '../../imports.dart';

class NoDataErrorWidget extends StatelessWidget {
  const NoDataErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(55)),
            child: Center(
              child: Image.asset(Assets.images.png.emptyList.path),
            )));
  }
}
