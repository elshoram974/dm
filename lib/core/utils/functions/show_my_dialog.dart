import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/generated/l10n.dart';

abstract final class ShowMyDialog {
  const ShowMyDialog();

  static void loading() {
    Get.dialog(
      const Align(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  static void error(BuildContext context, {required String body}) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).error,
          body: body,
          crossAxisAlignment: CrossAxisAlignment.center,
          textCancel: S.of(context).understood,
          onPressCancel: Get.back,
        );
      },
    );
  }

  static Future<bool?> back(
    BuildContext context, {
    String? body,
    void Function()? onGoBack,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: S.of(context).goBack,
          body: body ?? S.of(context).areYouSureYouWantToReturnBack,
          crossAxisAlignment: CrossAxisAlignment.center,
          textCancel: S.of(context).goBack,
          onPressCancel: () {
            if (onGoBack != null) onGoBack();
            Get.back();
            Get.back();
          },
          textConfirm: S.of(context).stayHere,
          onPressConfirm: Get.back,
        );
      },
    );
  }
}
