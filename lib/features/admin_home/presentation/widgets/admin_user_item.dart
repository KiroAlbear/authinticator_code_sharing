import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../imports.dart';

class AdminUserItem extends StatelessWidget {
  final String userId;
  final String name;
  final String phone;
  final String email;
  final String? expiryDate;
  final String? lastLoginDate;
  final String? startDate;
  final String? endDate;
  final int? requestedCodes;
  final int daysLeft;
  final bool isNew;
  final bool isBlocked;
  final String adminPassword;
  final bool isMaximumCodesReached;
  final double _horizontalPadding = 18.0;

  AdminUserItem(
      {required this.userId,
      required this.name,
      required this.phone,
      required this.email,
      required this.expiryDate,
      required this.lastLoginDate,
      required this.daysLeft,
      required this.requestedCodes,
      required this.startDate,
      required this.endDate,
      required this.adminPassword,
      this.isNew = false,
      this.isBlocked = false,
      this.isMaximumCodesReached = false,
      super.key});

  final SizedBox seperatorHeight = 5.verticalSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        padding: const EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(90),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: _horizontalPadding,
                    end: _horizontalPadding,
                    top: 10,
                    bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "User Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              userId,
                              style: AppTextStyles.bold_20_black_appbarText(
                                      context)
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 5),
                          child: InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: userId));
                                AppToast.showToast(
                                    "User ID copied to clipboard",
                                    type: AppToastType.success,
                                    context: context);
                              },
                              child: const Icon(
                                Icons.copy,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text(
                          name.substring(0, 2).toUpperCase(),
                          style: AppTextStyles.regular_14_white(context)
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    )
                    // Row(
                    //   children: [
                    //     isBlocked
                    //         ? UserBlockedWidget()
                    //         : isNew
                    //             ? UserNewWidget()
                    //             : SizedBox(),
                    //     IconButton(
                    //         onPressed: () {
                    //           showDialog(
                    //             useRootNavigator: true,
                    //             context: context,
                    //             builder: (_) {
                    //               return CustomOkCancelDialog(
                    //                 onOkPressed: () {
                    //                   BlocProvider.of<AdminHomeBloc>(context)
                    //                       .add(deleteUserEvent(
                    //                           requestModel:
                    //                               DeleteUserRequestModel(
                    //                                   userCode: userId,
                    //                                   email: email,
                    //                                   password:
                    //                                       adminPassword)));
                    //                 },
                    //               );
                    //             },
                    //           );
                    //         },
                    //         icon: Icon(Icons.delete, color: Colors.red)),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  Row(
                    children: [
                      const Text("Account Details",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      const SizedBox(width: 10),
                      isBlocked
                          ? const UserRedLabel(
                              title: "Blocked",
                            )
                          : daysLeft == 0
                              ? const UserRedLabel(
                                  title: "Expired",
                                )
                              : isNew
                                  ? const UserNewWidget()
                                  : const SizedBox(),
                    ],
                  ),
                  seperatorHeight,
                  _buildRowItem(title: "Name", value: name, context: context),
                  phone.isEmpty ? const SizedBox() : seperatorHeight,
                  phone.isEmpty
                      ? const SizedBox()
                      : _buildRowItem(
                          title: "Phone", value: phone, context: context),
                  seperatorHeight,
                  _buildRowItem(title: "Email", value: email, context: context),
                  // expiryDate == null ? SizedBox() : seperatorHeight,
                  // expiryDate == null
                  //     ? SizedBox()
                  //     : _buildRowItem(
                  //         title: "Expiry Date",
                  //         value: expiryDate!,
                  //         context: context),

                  startDate == null ? const SizedBox() : seperatorHeight,
                  startDate == null
                      ? const SizedBox()
                      : _buildRowItem(
                          title: "Start Date",
                          value: startDate!,
                          context: context),
                  endDate == null ? const SizedBox() : seperatorHeight,
                  endDate == null
                      ? const SizedBox()
                      : _buildRowItem(
                          title: "End Date", value: endDate!, context: context),
                  seperatorHeight,
                  _buildRowItem(
                      title: "Days Left",
                      value: daysLeft.toString(),
                      context: context,
                      widget: DaysCountWidget(count: daysLeft)),
                  Container(
                    height: 1,
                    color: Colors.grey.withAlpha(50),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  const Text("Logins Usage",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  lastLoginDate == null ? const SizedBox() : seperatorHeight,
                  lastLoginDate == null
                      ? const SizedBox()
                      : _buildRowItem(
                          title: "Last Login Date",
                          value: lastLoginDate!,
                          context: context),
                  requestedCodes == null ? const SizedBox() : seperatorHeight,
                  requestedCodes == null
                      ? const SizedBox()
                      : _buildRowItem(
                          title: "Requested Codes",
                          value: requestedCodes.toString(),
                          context: context,
                          widget: LoginCountWidget(count: requestedCodes!)),
                  isMaximumCodesReached ? 10.verticalSpace : const SizedBox(),
                  isMaximumCodesReached
                      ? MaximumCodesReachedWidget(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomOkCancelDialog(
                                  onOkPressed: () {
                                    BlocProvider.of<AdminHomeBloc>(context).add(
                                        resetUserEvent(
                                            requestModel: ResetUserRequestModel(
                                                email: email,
                                                userCode: userId)));
                                  },
                                );
                              },
                            );
                          },
                        )
                      : const SizedBox(),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTextButton(
                          text: "Delete",
                          onPressed: () {
                            showDialog(
                              useRootNavigator: true,
                              context: context,
                              builder: (_) {
                                return CustomOkCancelDialog(
                                  onOkPressed: () {
                                    BlocProvider.of<AdminHomeBloc>(context).add(
                                        deleteUserEvent(
                                            requestModel:
                                                DeleteUserRequestModel(
                                                    userCode: userId,
                                                    email: email,
                                                    password: adminPassword)));
                                  },
                                );
                              },
                            );
                          },
                          context: context),
                      _buildTextButton(
                          text: "Update",
                          onPressed: () {
                            Routes.navigateToScreen(Routes.registerUserScreen,
                                    NavigationType.pushNamed, context,
                                    extra: RegisterUserPageArgs(
                                        requestModel: UpdateUserRequestModel(
                                            userId: userId,
                                            email: email,
                                            name: name,
                                            phone: phone,
                                            startDate: startDate!,
                                            endDate: endDate!)))
                                .then(
                              (value) {
                                BlocProvider.of<AdminHomeBloc>(context)
                                    .add(getAdminHomeEvent(
                                  requestModel: AdminHomeRequestModel(
                                    email: email,
                                    password: adminPassword,
                                  ),
                                ));
                              },
                            );
                          },
                          context: context),
                      const SizedBox(width: 10),
                      isBlocked
                          ? _unBlockUserButton(context)
                          : _blockUserButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildTextButton(
      {required String text,
      required Function() onPressed,
      required BuildContext context}) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ));
  }

  Widget _unBlockUserButton(BuildContext context) {
    return UnblockUserButtonWidget(onPressed: () {
      showDialog(
        context: context,
        builder: (_) {
          return CustomOkCancelDialog(
            onOkPressed: () {
              BlocProvider.of<AdminHomeBloc>(context).add(
                  enableDisableUserEvent(
                      requestModel: EnableDisableUserRequestModel(
                          email: email, userCode: userId, isActive: true)));
            },
          );
        },
      );
    });
  }

  Widget _blockUserButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return CustomOkCancelDialog(
              onOkPressed: () {
                BlocProvider.of<AdminHomeBloc>(context).add(
                    enableDisableUserEvent(
                        requestModel: EnableDisableUserRequestModel(
                            email: email, userCode: userId, isActive: false)));
              },
            );
          },
        );
      },
      text: "Block",
      color: Colors.red,
    );
  }

  Widget _buildRowItem(
      {required String title,
      required String value,
      required BuildContext context,
      Widget? widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.regular_14_black(context).copyWith(
              color: Colors.black.withAlpha(95), fontWeight: FontWeight.w700),
        ),
        widget ??
            Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.semiBold_14_black_noSpacing(context),
            ),
      ],
    );
  }
}
