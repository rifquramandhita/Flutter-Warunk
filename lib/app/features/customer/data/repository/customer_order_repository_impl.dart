import 'dart:io';
import 'package:warunk/app/features/customer/data/source/customer_order_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderRepositoryImpl implements CustomerOrderRepository {
  final CustomerOrderApiService _apiService;

  CustomerOrderRepositoryImpl({required CustomerOrderApiService apiService})
    : _apiService = apiService;

  @override
  Future<DataState<CustomerCheckoutOptionEntity>> getCheckoutOptions(
    CustomerCheckoutSendParam param,
  ) {
    return handleResponse(
      () => _apiService.getCheckoutOptions(param.toJson()),
      (json) =>
          CustomerCheckoutOptionEntity.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<DataState<CustomerCheckoutOptionEntity>> getCheckoutShippingOption(
    CustomerCheckoutGetShippingOptionParam param,
  ) {
    return handleResponse(
      () => _apiService.getCheckoutShippingOption(param.toJson()),
      (json) =>
          CustomerCheckoutOptionEntity.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<DataState> createOrder(CustomerOrderCreateParam param) {
    return handleResponse(() {
      String? promotionsJson;
      if (param.promotionId != null) {
        promotionsJson = '[{"id":"${param.promotionId}"}]';
      } else if (param.promotionCode != null) {
        promotionsJson = '[{"code":"${param.promotionCode}"}]';
      }

      return _apiService.createOrder(
        param.addressId,
        param.shippingKey,
        param.biteshipRateKey,
        param.merchantAccountId,
        param.notes,
        File(param.paymentProof),
        param.cartIds,
        promotionsJson,
      );
    }, (json) => null);
  }
}
