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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: _horizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          userId,
                          style:
                              AppTextStyles.bold_20_black_appbarText(context),
                        ),
                        IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: userId));
                              AppToast.showToast("User ID copied to clipboard",
                                  type: AppToastType.success, context: context);
                            },
                            icon: Icon(Icons.copy, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        isBlocked
                            ? UserBlockedWidget()
                            : isNew
                                ? UserNewWidget()
                                : SizedBox(),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                useRootNavigator: true,
                                context: context,
                                builder: (_) {
                                  return CustomOkCancelDialog(
                                    onOkPressed: () {
                                      BlocProvider.of<AdminHomeBloc>(context)
                                          .add(deleteUserEvent(
                                              requestModel:
                                                  DeleteUserRequestModel(
                                                      userCode: userId,
                                                      email: email,
                                                      password:
                                                          adminPassword)));
                                    },
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
                child: Column(
                  children: [
                    25.verticalSpace,
                    _buildRowItem(
                        title: "Name:", value: name, context: context),
                    phone.isEmpty ? SizedBox() : seperatorHeight,
                    phone.isEmpty
                        ? SizedBox()
                        : _buildRowItem(
                            title: "Phone:", value: phone, context: context),
                    seperatorHeight,
                    _buildRowItem(
                        title: "Email:", value: email, context: context),
                    expiryDate == null ? SizedBox() : seperatorHeight,
                    expiryDate == null
                        ? SizedBox()
                        : _buildRowItem(
                            title: "Expiry Date:",
                            value: expiryDate!,
                            context: context),
                    lastLoginDate == null ? SizedBox() : seperatorHeight,
                    lastLoginDate == null
                        ? SizedBox()
                        : _buildRowItem(
                            title: "Last Login Date:",
                            value: lastLoginDate!,
                            context: context),
                    startDate == null ? SizedBox() : seperatorHeight,
                    startDate == null
                        ? SizedBox()
                        : _buildRowItem(
                            title: "Start Date:",
                            value: startDate!,
                            context: context),
                    endDate == null ? SizedBox() : seperatorHeight,
                    endDate == null
                        ? SizedBox()
                        : _buildRowItem(
                            title: "End Date:",
                            value: endDate!,
                            context: context),
                    requestedCodes == null ? SizedBox() : seperatorHeight,
                    requestedCodes == null
                        ? SizedBox()
                        : _buildRowItem(
                            title: "Requested Codes:",
                            value: requestedCodes.toString(),
                            context: context,
                            widget: LoginCountWidget(count: requestedCodes!)),
                    seperatorHeight,
                    _buildRowItem(
                        title: "Days Left:",
                        value: daysLeft.toString(),
                        context: context,
                        widget: DaysCountWidget(count: daysLeft)),
                    isMaximumCodesReached ? 10.verticalSpace : SizedBox(),
                    isMaximumCodesReached
                        ? MaximumCodesReachedWidget(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return CustomOkCancelDialog(
                                    onOkPressed: () {
                                      BlocProvider.of<AdminHomeBloc>(context)
                                          .add(resetUserEvent(
                                              requestModel:
                                                  ResetUserRequestModel(
                                                      email: email,
                                                      userCode: userId)));
                                    },
                                  );
                                },
                              );
                            },
                          )
                        : SizedBox(),
                    15.verticalSpace,
                    isBlocked
                        ? UnblockUserButtonWidget(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return CustomOkCancelDialog(
                                  onOkPressed: () {
                                    BlocProvider.of<AdminHomeBloc>(context).add(
                                        enableDisableUserEvent(
                                            requestModel:
                                                EnableDisableUserRequestModel(
                                                    email: email,
                                                    userCode: userId,
                                                    isActive: true)));
                                  },
                                );
                              },
                            );
                          })
                        : _blockUserButton(context),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _blockUserButton(BuildContext context) {
    return CustomElevatedButton(
      width: double.infinity,
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
      text: "Block User",
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
          style: AppTextStyles.regular_14_black(context)
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
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
