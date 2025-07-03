import 'package:flutter/material.dart';

import '../../../../imports.dart';

class UserNewWidget extends StatelessWidget {
  const UserNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(20),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          LocaleKeys.new_user.tr(),
          style: AppTextStyles.regular_12_red(context)
              .copyWith(color: Colors.green),
        ),
      ),
    );
  }
}
