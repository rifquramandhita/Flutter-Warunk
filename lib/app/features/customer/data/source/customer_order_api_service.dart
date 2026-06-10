import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_order_api_service.g.dart';

@RestApi()
abstract class CustomerOrderApiService {
  factory CustomerOrderApiService(Dio dio, {String baseUrl}) = _CustomerOrderApiService;

  @POST('/api/orders/options')
  Future<HttpResponse<dynamic>> getCheckoutOptions(@Body() Map<String, dynamic> body);

  @POST('/api/checkout/shipping-options')
  Future<HttpResponse<dynamic>> getCheckoutShippingOption(@Body() Map<String, dynamic> body);

  @POST('/api/orders/promotions')
  Future<HttpResponse<dynamic>> getPromotions(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/api/orders')
  Future<HttpResponse<dynamic>> createOrder(
    @Part(name: 'address_id') String addressId,
    @Part(name: 'shipping_key') String? shippingKey,
    @Part(name: 'biteship_rate_key') String? biteshipRateKey,
    @Part(name: 'merchant_account_id') String? merchantAccountId,
    @Part(name: 'notes') String? notes,
    @Part(name: 'payment_proof') File paymentProof,
    @Part(name: 'cart_ids[]') List<String> cartIds,
    @Part(name: 'promotions[0][id]') String? promotionId,
    @Part(name: 'promotions[0][code]') String? promotionCode,
  );

  @GET('/api/orders/{id}')
  Future<HttpResponse<dynamic>> getOrderById(@Path('id') String id);

  @GET('/api/orders')
  Future<HttpResponse<dynamic>> getOrders();
}
