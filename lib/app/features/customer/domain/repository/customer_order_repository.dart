import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerOrderRepository {
  Future<DataState<CustomerCheckoutOptionEntity>> getCheckoutOptions(
    CustomerCheckoutSendParam param,
  );
  Future<DataState<CustomerCheckoutOptionEntity>> getCheckoutShippingOption(
    CustomerCheckoutGetShippingOptionParam param,
  );
  Future<DataState<List<CustomerPromotionEntity>>> getPromotions(
    CustomerOrderGetPromotionParam param,
  );
  Future<DataState> createOrder(CustomerOrderCreateParam param);
}
