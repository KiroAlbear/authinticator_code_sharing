import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../imports.dart';

class SwitchAccountWidget extends StatelessWidget {
  const SwitchAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.screenUtil.screenWidth * 0.1,
        vertical: 30.h,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Switch Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: CommonUtils.getAdminAccountList(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.accounts.length ?? 0,
                    itemBuilder: (context, index) {
                      final account = snapshot.data!.accounts[index];
                      return ListTile(
                        title: Text(account.email),
                        // leading purple circle with profile icon
                        leading: const CircleAvatar(
                          backgroundColor: Colors.purple,
                          child:
                              Icon(Icons.person_rounded, color: Colors.white),
                        ),

                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return CustomOkCancelDialog(
                                  onOkPressed: () async {
                                await CommonUtils.saveAdminUsernameAndPassword(
                                    account.email, account.password);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                // show top snackbar
                                ScaffoldMessenger.of(Routes
                                        .rootNavigatorKey.currentState!.context)
                                    .showSnackBar(SnackBar(
                                  showCloseIcon: true,
                                  content: Text(
                                      "Switched to account: ${account.email}"),
                                ));
                                Routes.clearStack();
                                Routes.navigateToScreen(
                                    Routes.adminHomeScreen,
                                    NavigationType.pushReplacementNamed,
                                    context);
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
