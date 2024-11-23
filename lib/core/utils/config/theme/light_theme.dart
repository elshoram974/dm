import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: AppColor.primaryLight,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColor.primaryLight,
        secondary: AppColor.secondaryLight,
      ),
    );
