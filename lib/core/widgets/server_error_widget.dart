import 'package:flutter/material.dart';
import 'package:key_bridge/imports.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(50)),
      child: Text(
        'Could not connect to the server',
        style: TextStyle(
            fontSize: AppDimensions.getFonTSize16,
            fontWeight: TextStyleBlueprint.regularFontWeight,
            color: StaticColors.black_735),
        textAlign: TextAlign.center,
      ),
    );
  }
}
