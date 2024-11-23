import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';

class ChooseDialogListTile<T> extends StatelessWidget {
  const ChooseDialogListTile({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    this.onTap,
    this.trailing,
  });
  final String title;
  final T value;
  final T? groupValue;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
      leading: Radio<T>(
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? context.theme.primaryColor
              : Colors.white,
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onTap == null ? null : (e) => onTap!(),
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text(title, style: context.textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
