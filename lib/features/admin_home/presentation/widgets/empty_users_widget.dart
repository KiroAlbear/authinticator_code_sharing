import 'package:code_grapper/core/routes/navigation_type.dart';
import 'package:code_grapper/core/routes/routes.dart';
import 'package:code_grapper/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            'No registered users',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
              onPressed: () {
                // Navigate to user registration page or perform registration action
                Routes.navigateToScreen(Routes.registerUserScreen,
                    NavigationType.pushReplacementNamed, context);
              },
              text: ('Register Users +')),
        ],
      ),
    );
  }
}
