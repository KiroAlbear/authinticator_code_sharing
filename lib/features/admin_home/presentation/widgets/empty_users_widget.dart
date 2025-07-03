import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../imports.dart';

class EmptyUsersWidget extends StatelessWidget {
  const EmptyUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          100.verticalSpace,
          Text(
            LocaleKeys.no_registered_users.tr(),
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
              onPressed: () {
                // Navigate to user registration page or perform registration action
                Routes.navigateToScreen(Routes.registerUserScreen,
                    NavigationType.pushReplacementNamed, context);
              },
              text: (LocaleKeys.register_user.tr())),
        ],
      ),
    );
  }
}
