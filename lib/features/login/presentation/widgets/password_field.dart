import 'package:flutter/material.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/functions/app_validate.dart';

import 'auth_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.hintText,
    required this.label,
    this.otherPass,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
  });
  final String? otherPass;
  final TextEditingController? controller;
  final String? hintText;
  final String label;
  final bool readOnly;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AuthField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.otherPass != null
          ? (val) => AppValidator.samePassword(val, widget.otherPass!)
          : (val) => AppValidator.auth(val, 0, 100, FieldType.password),
      obscureText: obscureText,
      suffixIconData: Icons.lock_outline_rounded,
      label: widget.label,
      hintText: widget.hintText,
      autofillHints: [AutofillHints.password, ...widget.autofillHints ?? []],
      onFieldSubmitted: widget.onFieldSubmitted,
      suffix: IconButton(
        onPressed: () => setState(() => obscureText = !obscureText),
        color: Colors.grey,
        tooltip: obscureText
            ? S.of(context).showPassword
            : S.of(context).hidePassword,
        icon: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
    );
  }
}
