import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/models/pagination_model/pagination_model.dart';
import 'package:shora/features/home/domain/entity/customer_card_entity.dart';

abstract class HomeRepositories {
  const HomeRepositories();

  Future<Status<PaginatedData<List<CustomerCardEntity>>>> getCustomers(
    int page, [
    String? query,
  ]);
}
