import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:key_bridge/core/widgets/custom_card_widget.dart';

import '../../../../imports.dart';
import 'block_user_button_widget.dart';

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
  final double _horizontalPadding = 24.0;

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
    return CustomCardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: _horizontalPadding,
                  end: _horizontalPadding,
                  top: 20,
                  bottom: 20),
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
                          Text(
                            LocaleKeys.user_password.tr(),
                            style: const TextStyle(
                                color: StaticColors.greyTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            userId,
                            style:
                                AppTextStyles.bold_20_black_appbarText(context)
                                    .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        child: InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: userId));
                              AppToast.showToast(LocaleKeys.user_id_copied.tr(),
                                  type: AppToastType.success, context: context);
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff5c547a),
                          Color(0xff39344b),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Center(
                      child: Text(
                        getNameShortCut(name),
                        style: AppTextStyles.regular_14_white(context).copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.withAlpha(50),
            margin: EdgeInsets.symmetric(
                vertical: 4, horizontal: _horizontalPadding),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.verticalSpace,
                Row(
                  children: [
                    Text(LocaleKeys.account_details.tr(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    const SizedBox(width: 10),
                    isBlocked
                        ? UserRedLabel(
                            title: LocaleKeys.blocked.tr(),
                          )
                        : daysLeft == 0
                            ? UserRedLabel(
                                title: LocaleKeys.expired.tr(),
                              )
                            : isNew
                                ? const UserNewWidget()
                                : const SizedBox(),
                  ],
                ),
                seperatorHeight,
                _buildRowItem(
                    icon: Icons.person, value: name, context: context),
                phone.isEmpty ? const SizedBox() : seperatorHeight,
                phone.isEmpty
                    ? const SizedBox()
                    : _buildRowItem(
                        icon: Icons.phone, value: phone, context: context),
                seperatorHeight,
                _buildRowItem(
                    icon: Icons.email, value: email, context: context),
                startDate == null ? const SizedBox() : seperatorHeight,
                startDate == null
                    ? const SizedBox()
                    : _buildRowItem(
                        icon: Icons.calendar_today,
                        value: startDate!,
                        context: context),
                endDate == null ? const SizedBox() : seperatorHeight,
                endDate == null
                    ? const SizedBox()
                    : _buildRowItem(
                        icon: Icons.calendar_today_outlined,
                        value: endDate!,
                        context: context),
                seperatorHeight,
                _buildRowItem(
                  icon: Icons.access_time_rounded,
                  value: "${daysLeft} ${LocaleKeys.days_left.tr()}",
                  context: context,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withAlpha(50),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                ),
                Text(LocaleKeys.logins_usage.tr(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                lastLoginDate == null ? const SizedBox() : seperatorHeight,
                lastLoginDate == null
                    ? const SizedBox()
                    : _buildTextRowItem(
                        title: LocaleKeys.last_login_date.tr(),
                        value: lastLoginDate!,
                        context: context),
                requestedCodes == null ? const SizedBox() : seperatorHeight,
                requestedCodes == null
                    ? const SizedBox()
                    : _buildTextRowItem(
                        title: LocaleKeys.requested_codes.tr(),
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
                                              email: email, userCode: userId)));
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
                        text: LocaleKeys.delete.tr(),
                        onPressed: () {
                          showDialog(
                            useRootNavigator: true,
                            context: context,
                            builder: (_) {
                              return CustomOkCancelDialog(
                                onOkPressed: () {
                                  BlocProvider.of<AdminHomeBloc>(context).add(
                                      deleteUserEvent(
                                          requestModel: DeleteUserRequestModel(
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
                        text: LocaleKeys.update.tr(),
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
      ),
    );
  }

  String getNameShortCut(String name) {
    List<String> nameParts = name.split(" ");
    nameParts.removeWhere((part) => part.isEmpty);
    if (nameParts.length > 1) {
      return nameParts[0][0] + nameParts[1][0];
    } else if (nameParts.isNotEmpty) {
      return nameParts[0].substring(0, 1).toUpperCase();
    }

    return "";
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
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
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
    return BlockUserButtonWidget(
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
    );
  }

  Widget _buildTextRowItem(
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
              .copyWith(color: StaticColors.greyTextColor),
        ),
        widget ??
            Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.regular_14_white_noSpacing(context),
            ),
      ],
    );
  }

  Widget _buildRowItem(
      {required IconData icon,
      required String value,
      required BuildContext context,
      Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          widget ??
              Text(
                value,
                textAlign: TextAlign.end,
                style: AppTextStyles.regular_14_white_noSpacing(context),
              ),
        ],
      ),
    );
  }
}
