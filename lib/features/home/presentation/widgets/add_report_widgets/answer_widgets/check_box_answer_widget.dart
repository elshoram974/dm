import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class CheckBoxAnswerWidget extends StatefulWidget {
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
  State<CheckBoxAnswerWidget> createState() => _CheckBoxAnswerWidgetState();
}

class _CheckBoxAnswerWidgetState extends State<CheckBoxAnswerWidget> {
  late bool isSelected = widget.isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged == null
          ? null
          : () {
              setState(() => isSelected = !isSelected);
              widget.onChanged!(isSelected);
            },
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        width: double.maxFinite,
        padding: const EdgeInsets.all(AppConst.smallPadding),
        decoration: BoxDecoration(
          color: widget.onChanged == null && isSelected
              ? Colors.greenAccent.shade100
              : context.theme.cardColor.withOpacity(0.8),
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
                    widget.choice,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: widget.onChanged == null
                  ? null
                  : (val) {
                      setState(() => isSelected = !isSelected);
                      widget.onChanged!(isSelected);
                    },
              fillColor: const WidgetStatePropertyAll(Colors.white),
              checkColor: Colors.green.shade900,
              side: BorderSide.none,
            )
          ],
        ),
      ),
    );
  }
}
