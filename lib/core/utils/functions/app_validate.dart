import '../config/locale/generated/l10n.dart';

enum FieldType { name, email, password, rePassword, other }

abstract final class AppValidator {
  const AppValidator();

  static String? samePassword(String? current, String previous) {
    if (current == null || current.trim() == "") return S.current.fillField;

    if (previous != current) return S.current.notSamePass;

    return null;
  }

  static String? auth(
    String? value,
    int min,
    int max,
    FieldType field,
  ) {
    assert(min <= max);
    if (value == null || value.trim() == "") return S.current.fillField;

    switch (field) {
      case FieldType.email:
        if (!isEmail(value)) return S.current.enterValidEmail;

      default:
    }

    if (value.length < min) {
      return S.current.cantBeLessThan(min);
    } else if (value.length > max) {
      return S.current.cantBeMoreThan(max);
    }

    return null;
  }

  static String? notEmpty(String? value) {
    if (value == null || value.trim() == "") return S.current.fillField;
    return null;
  }
}

bool isEmail(email) {
  const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  return RegExp(emailRegExp).hasMatch(email);
}
