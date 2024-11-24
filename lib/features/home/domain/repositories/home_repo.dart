import 'package:shora/core/status/status.dart';
import 'package:shora/features/home/domain/entity/customer_card_entity.dart';

abstract class HomeRepositories {
  const HomeRepositories();

  Future<Status<List<CustomerCardEntity>>> getCustomers();
}
