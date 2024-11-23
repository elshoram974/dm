import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';

class ResLayoutBuilder extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  const ResLayoutBuilder({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        if (width <= AppConst.maxPhone) {
          return phone;
        } else if (width <= AppConst.maxTablet) {
          return tablet;
        }

        return desktop;
      },
    );
  }
}
