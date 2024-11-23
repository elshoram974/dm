import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    this.suffixIconData,
    this.hintText,
    required this.label,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.autofillHints,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction = TextInputAction.next, 
    this.isPhoneNumber = false, 
    this.onPhoneInputChanged,
  });
  final TextEditingController? controller;
  final IconData? suffixIconData;
  final String? hintText;
  final String label;
  final Widget? suffix;
  final bool obscureText;
  final bool readOnly;
  final bool isPhoneNumber;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PhoneNumber)? onPhoneInputChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 0.5 * AppConst.defaultPadding),
        MyDefaultField(
          readOnly: readOnly,
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          prefix: Icon(
            suffixIconData,
            color: context.theme.primaryColor.withOpacity(0.8),
          ),
          suffix: suffix,
          obscureText: obscureText,
          onChanged: onChanged,
          isPhoneNumber: isPhoneNumber,
          autofillHints: autofillHints,
          onPhoneInputChanged: onPhoneInputChanged,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
