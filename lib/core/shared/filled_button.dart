import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/app_constants.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.text,
    this.icon,
    this.isLoading = false,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.filledColor,
    this.padding,
    this.minimumSize,
    this.makeFittedBox = false,
  });
  final Widget? icon;
  final String? text;
  final bool isLoading;
  final TextStyle? style;
  final Color? filledColor;
  final Size? minimumSize;
  final bool makeFittedBox;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _loadingFilledButton();
    }
    return _filledButton();
  }

  Builder _filledButton() {
    return Builder(
      builder: (context) {
        return SizedBox.fromSize(
          size: minimumSize ?? const Size(256, 64),
          child: FilledButton(
            onPressed: onPressed,
            onLongPress: onLongPress,
            style: FilledButton.styleFrom(
              padding: padding,
              minimumSize: minimumSize ?? const Size(256, 64),
              backgroundColor: filledColor ?? context.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
              ),
            ),
            child: text == null
                ? icon
                : makeFittedBox
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          text!,
                          textAlign: TextAlign.center,
                          style: style?.copyWith(color: Colors.white) ??
                              const TextStyle(color: Colors.white),
                        ),
                      )
                    : Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: style?.copyWith(color: Colors.white) ??
                            const TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
          ),
        );
      },
    );
  }

  Builder _loadingFilledButton() {
    return Builder(
      builder: (context) {
        return FilledButton(
          onPressed: null,
          style: FilledButton.styleFrom(
            minimumSize: minimumSize ?? const Size(256, 64),
            backgroundColor: filledColor ?? context.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConst.borderRadius),
            ),
          ),
          child: SizedBox.square(
            dimension: min(
              min(minimumSize?.width ?? 100, minimumSize?.height ?? 100),
              30,
            ),
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
