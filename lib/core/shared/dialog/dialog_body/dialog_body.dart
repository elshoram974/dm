import 'package:flutter/material.dart';
import 'package:shora/core/utils/extensions/padding_ex.dart';

import '../../../utils/constants/app_constants.dart';
import 'dialog_buttons.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({
    super.key,
    required this.crossAxisAlignment,
    required this.customBody,
    required this.body,
    required this.bodyAlign,
    required this.onPressConfirm,
    required this.showCancelButton,
    required this.onPressCancel,
    required this.textConfirm,
    required this.textCancel,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final Widget? customBody;
  final String body;
  final TextAlign? bodyAlign;
  final void Function()? onPressConfirm;
  final bool showCancelButton;
  final void Function()? onPressCancel;
  final String? textConfirm;
  final String? textCancel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Visibility(
            visible: customBody == null,
            replacement: customBody ?? const SizedBox.shrink(),
            child: Text(
              body,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: bodyAlign,
            ),
          ).verticalPadding(2 * AppConst.defaultPadding),
          DialogButtons(
            onPressConfirm: onPressConfirm,
            showCancelButton: showCancelButton,
            onPressCancel: onPressCancel,
            textConfirm: textConfirm,
            textCancel: textCancel,
          )
        ],
      ),
    );
  }
}
