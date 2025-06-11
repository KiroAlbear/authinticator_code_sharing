import 'package:code_grapper/gen/locale_keys.g.dart';
import 'package:code_grapper/imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAdminPage extends BaseStatelessPage {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController secretKeyController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(false);
  final GlobalKey<FormState> formFieldKey = GlobalKey<FormState>();

  RegisterAdminPage({super.key});

  @override
  PreferredSizeWidget? appBar() => CustomAppbar(
        title: LocaleKeys.register.tr(),
      );

  @override
  bool containPadding() => false;

  @override
  Widget body(BuildContext context) {
    if (kDebugMode) {
      emailController.text = "program.gpt3@gmail.com";
      secretKeyController.text = "2XTVRQK4CFJBSSNHK5GSBPKGCVLQEGR";
      passwordController.text = "kiro123#";
      confirmPasswordController.text = "kiro123#";
    }
    return Scaffold(
      body: AuthenticationCardWidget(
        title: LocaleKeys.register.tr(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Name
            Form(
              key: formFieldKey,
              child: Column(
                children: [
                  // Email
                  CustomTextField(
                    controller: emailController,
                    validationMessage:
                        LocaleKeys.email_is_not_correct_format.tr(),
                    validationFunction: (p0) {
                      return CommonValidators.isValidEmail(p0 ?? "");
                    },
                    labelText: LocaleKeys.email.tr(),
                  ),
                  SizedBox(height: 15),

                  CustomTextField(
                    controller: secretKeyController,
                    labelText: "Secret Key",
                  ),
                  SizedBox(height: 15),

                  // Password
                  CustomTextField(
                    controller: passwordController,
                    isPasswordField: true,
                    validationMessage: LocaleKeys.password_should_have.tr(),
                    validationFunction: (p0) {
                      return CommonValidators.isValidPassword(p0 ?? "");
                    },
                    labelText: LocaleKeys.password.tr(),
                  ),
                  SizedBox(height: 15),

                  // Confirm Password
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPasswordField: true,
                    labelText: LocaleKeys.confirm_password.tr(),
                    validationMessage: LocaleKeys.passwords_do_not_match.tr(),
                    validationFunction: (String? p0) {
                      if (p0 != passwordController.text) {
                        return false;
                      } else {
                        return true;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ParentBloc<RegisterAdminBloc, RegisterAdminState>(
                showWidgetOnError: true,
                listenerFunction: (context, state) async {
                  if (state.status == Status.success) {
                    await CommonUtils.saveAdminUsernameAndPassword(
                        emailController.text, passwordController.text);

                    Routes.navigateToScreen(Routes.adminHomeScreen,
                        NavigationType.goNamed, context);
                  }
                },
                builder: (RegisterAdminState state) {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (formFieldKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CustomOkCancelDialog(onOkPressed: () {
                              BlocProvider.of<RegisterAdminBloc>(context).add(
                                registerAdminEvent(
                                  requestModel: RegisterAdminRequestModel(
                                    adminUserName: emailController.text,
                                    adminPassword: passwordController.text,
                                    secretKey: secretKeyController.text,
                                  ),
                                ),
                              );
                            });
                          },
                        );
                      }
                    },
                    text: (LocaleKeys.register.tr()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
