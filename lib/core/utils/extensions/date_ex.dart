import 'package:intl/intl.dart';

extension DateHelperEx on DateTime {
  String formattedDate(String format) => DateFormat(format).format(this);

  String get ddMMYYYY => formattedDate("dd-MM-yyyy");
  String get ddMMYYYYSlash => formattedDate("dd/MM/yyyy");
  String get mmDDYYYYSlashEN => DateFormat("MM/dd/yyyy", "EN").format(this);
  String get MMMM => DateFormat.MMMM().format(this);
}
