import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.suffixIconData,
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
  });
  final TextEditingController? controller;
  final IconData suffixIconData;
  final String? hintText;
  final String label;
  final Widget? suffix;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
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
          autofillHints: autofillHints,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
