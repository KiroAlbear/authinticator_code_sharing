import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterUserPage extends BaseStatefulPage {
  final RegisterUserPageArgs? args;

  const RegisterUserPage({this.args, super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPagePageState();
}

class _RegisterUserPagePageState extends BaseState<RegisterUserPage> {
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

  @override
  bool containPadding() => false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        emailController.text = Constants.chosenAdmin.email;

        if (widget.args == null) {
          startDate = DateTime.now();
          startDateController.text = dateFormat.format(startDate!);
        } else {
          nameController.text = widget.args!.requestModel.name;
          phoneController.text = widget.args!.requestModel.phone;
          startDateController.text = widget.args!.requestModel.startDate;
          endDateController.text = widget.args!.requestModel.endDate;

          startDate = DateTime.parse(
            widget.args!.requestModel.startDate,
          );
          endDate = DateTime.parse(
            widget.args!.requestModel.endDate,
          );
        }
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
        title: widget.args == null
            ? LocaleKeys.add_user.tr()
            : LocaleKeys.update_user.tr(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formFieldKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    labelText: LocaleKeys.name.tr(),
                  ),
                  SizedBox(height: 15),

                  CustomTextField(
                    controller: phoneController,
                    isNumbersOnlyField: true,
                    labelText: LocaleKeys.phone.tr(),
                    isRequired: false,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 15),
                  // Phone
                  CustomTextField(
                    controller: emailController,
                    isNumbersOnlyField: true,
                    labelText: LocaleKeys.email.tr(),
                    isDisabled: true,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                      controller: startDateController,
                      labelText: LocaleKeys.User_Start_Date.tr(),
                      onTap: () async {
                        await CommonUtils.pickDate(context).then(
                          (value) {
                            if (value != null) {
                              startDate = value;
                              startDateController.text =
                                  dateFormat.format(startDate!);
                            }
                          },
                        );
                      }),
                  SizedBox(height: 15),
                  CustomTextField(
                      controller: endDateController,
                      labelText: LocaleKeys.User_End_Date.tr(),
                      validationMessage: LocaleKeys.First_Date_should_be.tr(),
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
                        await CommonUtils.pickDate(context).then(
                          (value) {
                            if (value != null) {
                              endDate = value;
                              endDateController.text =
                                  dateFormat.format(endDate!);
                            }
                          },
                        );
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
                listenerFunction: (context, state) async {
                  if (state.savingStatus == Status.success &&
                      widget.args == null) {
                    _slideUp();
                    nameController.clear();
                    phoneController.clear();
                    startDateController.clear();
                    endDateController.clear();
                  } else if (state.savingStatus == Status.success &&
                      widget.args != null) {
                    nameController.clear();
                    phoneController.clear();
                    startDateController.clear();
                    endDateController.clear();
                    Navigator.pop(context);
                  }
                },
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
                                if (widget.args == null) {
                                  BlocProvider.of<RegisterUserBloc>(context)
                                      .add(
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
                                } else {
                                  BlocProvider.of<RegisterUserBloc>(context)
                                      .add(updateUserEvent(
                                          updateRequestModel:
                                              UpdateUserRequestModel(
                                    name: nameController.text,
                                    userId: widget.args!.requestModel.userId,
                                    startDate: dateFormat.format(startDate!),
                                    endDate: dateFormat.format(endDate!),
                                    email: Constants.chosenAdmin.email,
                                    phone: phoneController.text,
                                  )));
                                }
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
