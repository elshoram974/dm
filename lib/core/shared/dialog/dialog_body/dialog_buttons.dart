import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/config/locale/generated/l10n.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({
    super.key,
    required this.onPressConfirm,
    required this.showCancelButton,
    required this.onPressCancel,
    required this.textConfirm,
    required this.textCancel,
  });

  final String? textConfirm;
  final String? textCancel;

  final void Function()? onPressConfirm;
  final bool showCancelButton;
  final void Function()? onPressCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: onPressConfirm != null,
          child: Expanded(
            flex: 10,
            child: FilledButton(
              onPressed: onPressConfirm,
              child: Text(
                textConfirm ?? S.of(context).confirm,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Visibility(
          visible: onPressConfirm != null && showCancelButton,
          child: const Spacer(),
        ),
        Visibility(
          visible: showCancelButton,
          child: Expanded(
            flex: 10,
            child: OutlinedButton(
              onPressed: onPressCancel ?? Get.back,
              child: Text(textCancel ?? S.of(context).cancel),
            ),
          ),
        ),
      ],
    );
  }
}
