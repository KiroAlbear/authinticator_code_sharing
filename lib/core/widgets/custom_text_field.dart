import 'package:code_grapper/core/routes/navigation_type.dart';
import 'package:code_grapper/core/routes/routes.dart';
import 'package:code_grapper/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? validationMessage;
  final bool isPasswordField;
  final bool isScannerField;
  final bool isNumbersOnlyField;
  final bool isDisabled;
  final bool isRequired;
  final bool Function(String?)? validationFunction;
  final TextInputType? keyboardType;
  final Function()? onTap;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validationFunction,
      this.isPasswordField = false,
      this.isRequired = true,
      this.keyboardType,
      this.isDisabled = false,
      this.isNumbersOnlyField = false,
      this.isScannerField = false,
      this.validationMessage,
      this.onTap});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueNotifier<String> _errorMessage = ValueNotifier("");
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  bool isPasswordTextVisible = false;

  @override
  void initState() {
    isPasswordTextVisible = widget.isPasswordField ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: isPasswordTextVisible,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          enabled: !widget.isDisabled,
          readOnly: widget.onTap != null,
          onTap: widget.onTap,
          inputFormatters: [
            if (widget.isNumbersOnlyField)
              FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) {
            if (widget.isRequired && (value == null || value.isEmpty)) {
              _errorMessage.value = LocaleKeys.this_field_is_required.tr();
            } else if (widget.validationFunction != null &&
                !widget.validationFunction!(value)) {
              _errorMessage.value = widget.validationMessage ?? "";
            } else {
              _errorMessage.value = "";
            }
            return _errorMessage.value.isEmpty ? null : _errorMessage.value;
          },
          decoration: InputDecoration(
              label: RichText(
                text: TextSpan(
                  text: widget.labelText,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                  children: [
                    widget.isRequired
                        ? const TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          )
                        : const TextSpan(text: ''),
                  ],
                ),
              ),
              // labelText:
              //     widget.isRequired ? '${widget.labelText}*' : widget.labelText,
              suffixIcon: widget.isPasswordField
                  ? ValueListenableBuilder(
                      valueListenable: isPasswordVisible,
                      builder: (context, value, child) {
                        return IconButton(
                          icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordTextVisible = value;
                            });
                            isPasswordVisible.value = !value;
                          },
                        );
                      },
                    )
                  : widget.isScannerField
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(end: 0),
                          child: IconButton(
                            icon: const Icon(Icons.qr_code_scanner_outlined),
                            onPressed: () async {
                              await Routes.navigateToScreen(
                                Routes.scannerScreen,
                                NavigationType.pushNamed,
                                context,
                                onPop: (p0) {
                                  widget.controller.text = p0;
                                },
                              );
                            },
                          ),
                        )
                      : SizedBox()),
        ),
        const SizedBox(height: 5),
        ValueListenableBuilder<String>(
          valueListenable: _errorMessage,
          builder: (context, String errorMessage, child) {
            return Visibility(
              visible: errorMessage.isEmpty ? false : true,
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ],
    );
  }
}
