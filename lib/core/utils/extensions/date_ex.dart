import 'package:intl/intl.dart';

extension DateHelperEx on DateTime {
  String formattedDate(String format) => DateFormat(format).format(this);

  String get ddMMYYYY => formattedDate("dd-MM-yyyy");
}
