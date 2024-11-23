import 'package:flutter/material.dart';
import 'package:shora/core/utils/extensions/responsive_ex.dart';

import '../../utils/constants/app_constants.dart';

class MyResConstrainedBoxAlign extends StatelessWidget {
  const MyResConstrainedBoxAlign({
    super.key,
    this.maxHeight = double.infinity,
    this.maxWidth,
    this.maxWidthNotPhone,
    this.minHeight = 0.0,
    this.minWidth = 0.0,
    required this.child,
  });
  final double minWidth;
  final double? maxWidth;
  final double? maxWidthNotPhone;
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
          maxWidth: maxWidth ??
              (context.isPhoneWidth
                  ? double.infinity
                  : maxWidthNotPhone ?? AppConst.constraint),
          minHeight: minHeight,
          minWidth: minWidth,
        ),
        child: child,
      ),
    );
  }
}

class MyResConstrainedBox extends StatelessWidget {
  const MyResConstrainedBox({
    super.key,
    this.maxHeight = double.infinity,
    this.maxWidth,
    this.maxWidthNotPhone,
    this.minHeight = 0.0,
    this.minWidth = 0.0,
    required this.child,
  });
  final double minWidth;
  final double? maxWidth;
  final double? maxWidthNotPhone;
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth ??
            (context.isPhoneWidth
                ? double.infinity
                : maxWidthNotPhone ?? AppConst.constraint),
        minHeight: minHeight,
        minWidth: minWidth,
      ),
      child: child,
    );
  }
}
