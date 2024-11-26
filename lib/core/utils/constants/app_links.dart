abstract final class AppLinks {
  const AppLinks();

  static const String login = '/api/v1/auth/delivery-man/login';

  static const String getCustomers = '/api/v1/distributor/customers/list';
  static const String getQuestions = '/api/v1/distributor/questions/list';
  static const String getOrders = '/api/v1/distributor/customers/orders';
  static const String getReports = '/api/v1/distributor/customers/reports';
  static const String addReports = '/api/v1/distributor/report/add';
  static const String getReportsDetails = '/api/v1/distributor/report/details';
}
