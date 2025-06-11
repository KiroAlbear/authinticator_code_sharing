import 'package:code_grapper/gen/locale_keys.g.dart';
import 'package:code_grapper/imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterUserPage extends BaseStatefulPage {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPagePageState();
}

class _RegisterUserPagePageState extends BaseState<RegisterUserPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final GlobalKey<FormState> formFieldKey = GlobalKey<FormState>();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  late DateTime? startDate;

  late DateTime? endDate;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  // final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  @override
  PreferredSizeWidget? appBar() => CustomAppbar(
        title: "Register User",
        hasBackButton: false,
      );

  @override
  bool containPadding() => false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        emailController.text = Constants.chosenAdmin.email;
      },
    );

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _setSlideUp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setSlideUp() {
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -1.0), // slide up
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _setSlideInFromBottom() {
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _slideUp() {
    setState(() {
      _setSlideUp();
    });
    _controller.reset();
    _controller.forward().then(
      (value) {
        _slideDown();
      },
    );
  }

  void _slideDown() {
    setState(() {
      _setSlideInFromBottom();
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget body(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: AuthenticationCardWidget(
        title: "Register User",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formFieldKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    labelText: "Name",
                  ),
                  SizedBox(height: 15),

                  CustomTextField(
                    controller: phoneController,
                    isNumbersOnlyField: true,
                    labelText: "Phone",
                    isRequired: false,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 15),
                  // Phone
                  CustomTextField(
                    controller: emailController,
                    isNumbersOnlyField: true,
                    labelText: "Email",
                    isDisabled: true,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                      controller: startDateController,
                      labelText: 'User Start Date',
                      onTap: () async {
                        startDate = await CommonUtils.pickDate(context);
                        if (startDate != null) {
                          startDateController.text =
                              dateFormat.format(startDate!);
                        }
                      }),
                  SizedBox(height: 15),
                  CustomTextField(
                      controller: endDateController,
                      labelText: 'User End Date',
                      validationMessage: "First Date should be before End Date",
                      validationFunction: (p0) {
                        if (startDateController.text.isEmpty ||
                            startDate == null) {
                          return false;
                        } else if (endDate!.isBefore(startDate!) ||
                            endDate!.isAtSameMomentAs(startDate!)) {
                          return false;
                        }
                        return true;
                      },
                      onTap: () async {
                        endDate = await CommonUtils.pickDate(context);
                        if (endDate != null) {
                          endDateController.text = dateFormat.format(endDate!);
                        }
                      }),

                  SizedBox(height: 20),

                  // Email
                ],
              ),
            ),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ParentBloc<RegisterUserBloc, RegisterUserState>(
                showWidgetOnError: true,
                builder: (RegisterUserState state) {
                  return CustomElevatedButton(
                    onPressed: () async {
                      if (formFieldKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return CustomOkCancelDialog(
                              onOkPressed: () {
                                BlocProvider.of<RegisterUserBloc>(context).add(
                                  registerUserEvent(
                                      registerRequestModel:
                                          RegisterUserRequestModel(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: Constants.chosenAdmin.email,
                                    startDate: dateFormat.format(startDate!),
                                    endDate: dateFormat.format(endDate!),
                                  )),
                                );
                                _slideUp();
                                nameController.clear();
                                phoneController.clear();
                                startDateController.clear();
                                endDateController.clear();
                              },
                            );
                          },
                        );
                      }
                    },
                    text: LocaleKeys.submit.tr(),
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
