import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

enum DeviceType { phone, tablet, desktop }

extension ResponsiveEX on BuildContext {
  bool get isPhoneWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width <= AppConst.maxPhone && width > 0;
  }

  bool get isTabletWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width <= AppConst.maxTablet && width > AppConst.maxPhone;
  }

  bool get isDesktopWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width >= AppConst.maxTablet;
  }

  DeviceType get deviceTypeAccordingToMaxWidth {
    double width = MediaQuery.sizeOf(this).width;
    if (width <= AppConst.maxPhone) {
      return DeviceType.phone;
    } else if (width <= AppConst.maxTablet) {
      return DeviceType.tablet;
    }

    return DeviceType.desktop;
  }

  DeviceType deviceTypeAccordingToGivenWidth(double width) {
    if (width <= AppConst.maxPhone) {
      return DeviceType.phone;
    } else if (width <= AppConst.maxTablet) {
      return DeviceType.tablet;
    }

    return DeviceType.desktop;
  }
}
