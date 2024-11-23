import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';

abstract final class ShowMySnackBar {
  const ShowMySnackBar();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> call(
    String content, {
    Duration? duration,
    TextStyle? style,
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(Get.context!);
    scaffold.clearSnackBars();
    return scaffold.showSnackBar(
      SnackBar(
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: style ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: backgroundColor == null ? null : Colors.white,
              ),
        ),
        action: action,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppConst.defaultPadding),
        duration: duration ?? AppConst.duration,
        actionOverflowThreshold: 1,
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      reRequestPermissionToast({
    required String text,
    required String actionText,
    required void Function() onPressed,
  }) {
    return call(
      text,
      duration: const Duration(seconds: 5),
      backgroundColor: Get.theme.colorScheme.error,
      action: SnackBarAction(
        label: actionText,
        onPressed: onPressed,
        textColor: Get.theme.primaryColor,
      ),
    );
  }
}
