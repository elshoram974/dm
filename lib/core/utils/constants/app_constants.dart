import 'package:shora/core/utils/extensions/date_ex.dart';

abstract final class AppConst {
  const AppConst();

  static const double borderSmallRadius = 5;
  static const double borderRadius = 10;
  static const double extraSmallPadding = 4;
  static const double smallPadding = 8;
  static const double defaultPadding = 16;
  static const double bigPadding = 24;
  static const double extraBigPadding = 32;

  static const double constraint = 600;
  static const double dialogConstraint = 400;

  static const int maxPhone = 500;
  static const int maxTablet = 900;

  static const Duration duration = Duration(seconds: 2);

  static final List<String> monthsInYear =
      List.generate(12, (i) => DateTime(0, i + 1).MMMM);
}
