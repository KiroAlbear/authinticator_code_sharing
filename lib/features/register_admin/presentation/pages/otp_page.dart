import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpPage extends BaseStatefulPage {
  final RegisterAdminRequestModel requestModel;

  const OtpPage({required this.requestModel, super.key});

  @override
  BaseState<OtpPage> createState() => _CodePagePageState();
}

class _CodePagePageState extends BaseState<OtpPage> {
  final double codeSeperatorWidth = 4.0;
  final double buttonWidth = double.infinity;
  final double buttonHeight = 50.0;
  final TextEditingController otpController = TextEditingController();

  @override
  bool containPadding() => false;

  @override
  bool showOnlyLogout() => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<RegisterAdminBloc>(context)
          .add(sendEmailEvent(email: widget.requestModel.adminUserName));
      AppToast.showToast(LocaleKeys.verification_code_is_sent.tr(),
          context: context, type: AppToastType.success);
    });
  }

  @override
  Widget body(BuildContext context) {
    return AuthenticationCardWidget(
        maxWidth: 450,
        title: LocaleKeys.verification_code.tr(),
        child: Column(
          children: [
            OtpPinField(
              key: UniqueKey(),
              onSubmit: (pin) {},
              keyboardType: TextInputType.number,
              fieldHeight: 50.h,
              fieldWidth: 35.w,
              autoFillEnable: false,
              phoneNumbersHint: true,
              beforeTextPaste: (text) {
                return false;
              },
              maxLength: 6,
              otpPinFieldDecoration:
                  OtpPinFieldDecoration.defaultPinBoxDecoration,
              otpPinFieldStyle: const OtpPinFieldStyle(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                    color: Colors.black),
                defaultFieldBackgroundColor: Color(0xfff0f0f0),
                defaultFieldBorderColor: Colors.transparent,
                fieldBorderWidth: 1,
                fieldBorderRadius: 5,
              ),
              onChange: (value) {
                otpController.text = value;
              },
            ),
            SizedBox(height: 40.h),
            ParentBloc<RegisterAdminBloc, RegisterAdminState>(
              showWidgetOnError: true,
              listenerFunction: (context2, state) async {
                if (state.status == Status.success && state.isVerified) {
                  await CommonUtils.saveAdminUsernameAndPassword(
                      widget.requestModel.adminUserName,
                      widget.requestModel.adminPassword);

                  Routes.navigateToScreen(
                      Routes.adminHomeScreen, NavigationType.goNamed, context);
                }
              },
              builder: (RegisterAdminState state) {
                return CustomElevatedButton(
                  width: buttonWidth.w,
                  height: buttonHeight.h,
                  onPressed: () async {
                    widget.requestModel.verificationCode = otpController.text;
                    BlocProvider.of<RegisterAdminBloc>(context).add(
                      registerAdminEvent(
                        requestModel: widget.requestModel,
                      ),
                    );
                  },
                  text: LocaleKeys.submit.tr(),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ));
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
