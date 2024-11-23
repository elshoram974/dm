import '../../../app_info.dart';

abstract final class AppLinks {
  const AppLinks();

  static const String _domain = AppInfo.baseURL;
  static const String _baseLink = '$_domain/api';

  static const String login = '$_baseLink/login';
}
