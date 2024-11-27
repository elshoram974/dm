import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class RadioAnswerWidget<T> extends StatelessWidget {
  const RadioAnswerWidget(
    this.choice, {
    super.key,
    this.onChanged,
    required this.value,
    this.groupValue,
  });
  final String choice;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged == null ? null : () => onChanged!(value),
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        width: double.maxFinite,
        padding: const EdgeInsets.all(AppConst.smallPadding),
        decoration: BoxDecoration(
          color: onChanged == null && groupValue == choice
              ? context.theme.primaryColor.withOpacity(0.25)
              : context.theme.cardColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: AppConst.smallPadding,
                ),
                child: FittedBox(
                  alignment: AlignmentDirectional.centerStart,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    choice,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            Radio<T>(
              value: value,
              onChanged: onChanged,
              fillColor: WidgetStatePropertyAll(context.theme.primaryColor),
              groupValue: groupValue,
            )
          ],
        ),
      ),
    );
  }
}
