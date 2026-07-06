import 'dart:io';
import 'package:warunk/app/features/customer/data/source/customer_order_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';
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
  Future<DataState<List<CustomerPromotionEntity>>> getPromotions(
    CustomerOrderGetPromotionParam param,
  ) {
    return handleResponse(
      () => _apiService.getPromotions(param.toJson()),
      (json) => List.from(
        json['promotions'].map((e) => CustomerPromotionEntity.fromJson(e)),
      ),
    );
  }

  @override
  Future<DataState<String>> createOrder(CustomerOrderCreateParam param) {
    return handleResponse(() {
      return _apiService.createOrder(
        param.addressId,
        param.shippingKey,
        param.biteshipRateKey,
        param.merchantAccountId,
        param.notes,
        param.cartIds,
        param.promotionId,
        param.promotionCode,
      );
    }, (json) => json['order']['id'] as String);
  }

  @override
  Future<DataState<CustomerOrderEntity>> getOrderById(String id) {
    return handleResponse(
      () => _apiService.getOrderById(id),
      (json) => CustomerOrderEntity.fromJson(json['order'] as Map<String, dynamic>),
    );
  }

  @override
  Future<DataState<List<CustomerOrderEntity>>> getOrders() {
    return handleResponse(
      () => _apiService.getOrders(),
      (json) => List.from(
        json['orders'].map((e) => CustomerOrderEntity.fromJson(e)),
      ),
    );
  }

  @override
  Future<DataState<CustomerOrderEntity>> completeOrder(
    CustomerOrderCompleteParam param,
  ) async {
    final formData = await param.toFormData();
    return handleResponse(
      () => _apiService.completeOrder(param.orderId, formData),
      (json) {
        if (json['order'] == null) return const CustomerOrderEntity();
        return CustomerOrderEntity.fromJson(json['order'] as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<String>> cancelOrder(CustomerOrderCancelParam param) {
    return handleResponse(
      () => _apiService.cancelOrder(param.orderId, param.toJson()),
      (json) => json['message'] as String? ?? 'Success',
    );
  }

  @override
  Future<DataState<dynamic>> submitPaymentProof(String id, File paymentProof) {
    return handleResponse(
      () => _apiService.submitPaymentProof(id, paymentProof),
      (json) => json,
    );
  }

  @override
  Future<DataState<CustomerOrderEntity>> receivedOrder(String id) {
    return handleResponse(
      () => _apiService.receivedOrder(id),
      (json) {
        if (json['order'] == null) return const CustomerOrderEntity();
        return CustomerOrderEntity.fromJson(
            json['order'] as Map<String, dynamic>);
      },
    );
  }
}
