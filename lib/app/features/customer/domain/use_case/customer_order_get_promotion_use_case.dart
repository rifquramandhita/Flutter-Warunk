import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderGetPromotionUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderGetPromotionUseCase(this._repository);

  Future<DataState<List<CustomerPromotionEntity>>> call({
    required CustomerOrderGetPromotionParam params,
  }) {
    return _repository.getPromotions(params);
  }
}
