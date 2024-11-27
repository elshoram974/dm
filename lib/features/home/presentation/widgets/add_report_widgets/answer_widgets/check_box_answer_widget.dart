import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class CheckBoxAnswerWidget extends StatelessWidget {
  const CheckBoxAnswerWidget(
    this.choice, {
    super.key,
    this.isSelected = false,
    this.onChanged,
  });
  final String choice;
  final bool isSelected;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged == null ? null : () => onChanged!(!isSelected),
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        width: double.maxFinite,
        padding: const EdgeInsets.all(AppConst.smallPadding),
        decoration: BoxDecoration(
          color: onChanged == null && isSelected
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
            Checkbox(
              value: isSelected,
              onChanged:
                  onChanged == null ? null : (_) => onChanged!(!isSelected),
              fillColor: const WidgetStatePropertyAll(Colors.white),
              checkColor: context.theme.primaryColor,
              side: BorderSide.none,
            )
          ],
        ),
      ),
    );
  }
}
