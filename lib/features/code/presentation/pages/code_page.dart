import 'dart:async';

import 'package:code_grapper/gen/locale_keys.g.dart';
import 'package:code_grapper/imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodePage extends BaseStatefulPage {
  const CodePage({super.key});

  @override
  BaseState<CodePage> createState() => _CodePagePageState();
}

class _CodePagePageState extends BaseState<CodePage> {
  @override
  PreferredSizeWidget? appBar() => CustomAppbar(
        title: LocaleKeys.home.tr(),
        hasBackButton: false,
      );

  final double codeSeperatorWidth = 4.0;
  final double buttonWidth = double.infinity;
  final double buttonHeight = 50.0;

  int _remainingTime = 5; // Countdown duration in seconds
  ValueNotifier<bool> _isButtonDisabled = ValueNotifier<bool>(false);
  Timer? _timer;

  @override
  bool containPadding() => false;

  @override
  bool showOnlyLogout() => true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Constants.chosenUser = await getChosenUser();
      BlocProvider.of<CodeBloc>(context).add(
        requestCodeEvent(
          email: Constants.chosenUser.email,
          userCode: Constants.chosenUser.password,
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _startCountdown() {
    _isButtonDisabled.value = true;

    setState(() {
      _remainingTime = 5; // Reset countdown
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _isButtonDisabled.value = false;
      }
    });
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: AppDimensions.screenUtil.screenWidth * 0.9,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Verification Code",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(height: 20.h),
                  ParentBloc<CodeBloc, CodeState>(
                    key: const Key("code_bloc"),
                    errorWidget: Text(
                      "Can not get code for this user",
                      style: AppTextStyles.regular_12_red(context),
                    ),
                    listenerFunction: (context, state) {
                      if (state.status == Status.success) {
                        _startCountdown();
                      }
                    },
                    builder: (state) {
                      return Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTextCode(state.codeData!.code[0]),
                              codeSeperatorWidth.horizontalSpace,
                              _buildTextCode(state.codeData!.code[1]),
                              codeSeperatorWidth.horizontalSpace,
                              _buildTextCode(state.codeData!.code[2]),
                              codeSeperatorWidth.horizontalSpace,
                              _buildTextCode(state.codeData!.code[3]),
                              codeSeperatorWidth.horizontalSpace,
                              _buildTextCode(state.codeData!.code[4]),
                              codeSeperatorWidth.horizontalSpace,
                              _buildTextCode(state.codeData!.code[5]),
                            ],
                          ),
                          // copy to clip board button
                          SizedBox(height: 30.h),
                          CustomElevatedButton(
                            width: buttonWidth.w,
                            height: buttonHeight.h,
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: state.codeData!.code));
                              // flutter toast
                              AppToast.showToast("Code copied to clipboard",
                                  type: AppToastType.success, context: context);
                              // Fluttertoast.showToast(
                              //   msg: "Code copied to clipboard",
                              //   toastLength: Toast.LENGTH_LONG,
                              //   gravity: ToastGravity.BOTTOM,
                              //   timeInSecForIosWeb: 1,
                              //   backgroundColor: Colors.black54,
                              //   textColor: Colors.white,
                              //   fontSize: 16.0.sp,
                              // );
                            },
                            text: "Copy to clipboard",
                          ),

                          // resend code button that turns into a countdown timer
                          SizedBox(height: 10.h),

                          ValueListenableBuilder<bool>(
                            valueListenable: _isButtonDisabled,
                            builder: (context, bool value, child) {
                              return CustomElevatedButton(
                                width: buttonWidth.w,
                                height: buttonHeight.h,
                                color: Colors.green,
                                onPressed: value
                                    ? null
                                    : () async {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return CustomOkCancelDialog(
                                              onOkPressed: () async {
                                                BlocProvider.of<CodeBloc>(
                                                        context)
                                                    .add(requestCodeEvent(
                                                        email: Constants
                                                            .chosenUser.email,
                                                        userCode: Constants
                                                            .chosenUser
                                                            .password));
                                              },
                                            );
                                          },
                                        );

                                        _startCountdown();
                                      },
                                text: value
                                    ? "Resend in $_remainingTime s"
                                    : "Resend Code",
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildTextCode(String text) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(40),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
        ),
      ),
    );
  }
}
