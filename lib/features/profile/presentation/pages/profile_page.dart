import 'package:key_bridge/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends BaseStatefulPage {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePagePageState();
}

class _ProfilePagePageState extends BaseState<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController secretKeyController = TextEditingController();
  final TextEditingController resetAfterController = TextEditingController();
  final TextEditingController maxLoginsController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> formFieldKey = GlobalKey<FormState>();

  @override
  bool containPadding() => false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getChosenAdmin().then(
      (EmailPasswordModel value) {
        BlocProvider.of<ProfileBloc>(context).add(
          getProfileEvent(ProfileRequestModel(
              email: value.email, password: value.password)),
        );
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return AuthenticationCardWidget(
      title: LocaleKeys.profile.tr(),
      child: ParentBloc<ProfileBloc, ProfileState>(
        showWidgetOnError: true,
        listenerFunction: (context, state) {
          emailController.text = state.profileResponseModel?.adminUserName ??
              Constants.chosenAdmin.email;
          secretKeyController.text =
              state.profileResponseModel?.secretKey ?? '';
          resetAfterController.text =
              state.profileResponseModel?.resetAfterDays.toString() ?? '';
          maxLoginsController.text =
              state.profileResponseModel?.maxLoginPerPeriod.toString() ?? '';

          startDateController.text =
              state.profileResponseModel?.startDate ?? '';

          endDateController.text = state.profileResponseModel?.endDate ?? '';
        },
        builder: (ProfileState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formFieldKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      labelText: LocaleKeys.email.tr(),
                      isDisabled: true,
                      isRequired: false,
                    ),
                    SizedBox(height: 15),

                    // Secret Key
                    CustomTextField(
                      controller: secretKeyController,
                      labelText: LocaleKeys.scan_or_enter_your_secret_key.tr(),
                      isScannerField: true,
                    ),
                    SizedBox(height: 15),

                    // Max Login
                    CustomTextField(
                      controller: maxLoginsController,
                      isNumbersOnlyField: true,
                      labelText: LocaleKeys.maximum_codes_per_user.tr(),
                      keyboardType: TextInputType.phone,
                      validationMessage:
                          LocaleKeys.should_be_positive_number.tr(),
                      validationFunction: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return false;
                        }
                        final value = int.tryParse(p0);
                        if (value == null || value <= 0) {
                          return false;
                        }
                        return true;
                      },
                    ),
                    SizedBox(height: 15),

                    // Start Date
                    CustomTextField(
                      controller: startDateController,
                      labelText: LocaleKeys.your_subscription_start_date.tr(),
                      isDisabled: true,
                      isRequired: false,
                    ),

                    SizedBox(height: 15),

                    // End Date
                    CustomTextField(
                      controller: endDateController,
                      labelText: LocaleKeys.your_subscription_end_date.tr(),
                      isDisabled: true,
                      isRequired: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () async {
                    if (formFieldKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return CustomOkCancelDialog(
                            onOkPressed: () {
                              BlocProvider.of<ProfileBloc>(context).add(
                                updateProfileEvent(UpdateProfileRequestModel(
                                  adminUserName: Constants.chosenAdmin.email,
                                  adminPassword: Constants.chosenAdmin.password,
                                  secretKey: secretKeyController.text,
                                  maxLoginPerPeriod:
                                      int.parse(maxLoginsController.text),
                                )),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                  text: LocaleKeys.submit.tr(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
