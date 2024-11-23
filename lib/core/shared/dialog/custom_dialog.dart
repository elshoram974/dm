import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_constants.dart';
import 'dialog_body/dialog_body.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title = 'Title',
    this.body = 'This is my Body',
    this.bodyAlign,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.customBody,
    this.onPressCancel,
    this.onPressConfirm,
    this.showCancelButton = true,
    this.textConfirm,
    this.textCancel,
  });
  final String title;
  final String body;
  final String? textConfirm;
  final String? textCancel;
  final bool showCancelButton;
  final Widget? customBody;
  final TextAlign? bodyAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final void Function()? onPressCancel;
  final void Function()? onPressConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppConst.defaultPadding),
        constraints: const BoxConstraints(maxWidth: AppConst.constraint),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            DialogBody(
              crossAxisAlignment: crossAxisAlignment,
              customBody: customBody,
              body: body,
              bodyAlign: bodyAlign,
              onPressConfirm: onPressConfirm,
              showCancelButton: showCancelButton,
              onPressCancel: onPressCancel,
              textConfirm: textConfirm,
              textCancel: textCancel,
            ),
          ],
        ),
      ),
    );
  }
}
