import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_merchant_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantMerchantApiService {
  factory MerchantMerchantApiService(Dio dio, {String baseUrl}) =
      _MerchantMerchantApiService;

  @GET('/api/seller/merchant')
  Future<HttpResponse<dynamic>> get();

  @GET('/api/seller/merchant/categories')
  Future<HttpResponse<dynamic>> getCategories();

  @GET('/api/seller/merchant/courier-code-available')
  Future<HttpResponse<dynamic>> getCourier();

  @GET('/api/seller/merchant/balance-histories')
  Future<HttpResponse<dynamic>> getHistoryBalance();

  @MultiPart()
  @PUT('/api/seller/merchant/information')
  Future<HttpResponse<dynamic>> update(
    @Part(name: 'photo') File? photo,
    @Part(name: 'name') String name,
    @Part(name: 'slug') String slug,
    @Part(name: 'merchant_category') String? merchantCategory,
    @Part(name: 'whatsapp_number') String? whatsappNumber,
  );

  @PUT('/api/seller/merchant/location')
  Future<HttpResponse<dynamic>> updateLocation(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/seller/merchant/accounts')
  Future<HttpResponse<dynamic>> updateAccount(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/seller/merchant/operational-hours')
  Future<HttpResponse<dynamic>> updateOperationalHours(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/api/seller/merchant/shipping-settings')
  Future<HttpResponse<dynamic>> updateShipping(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/seller/merchant/open')
  Future<HttpResponse<dynamic>> open();

  @POST('/api/seller/merchant/close')
  Future<HttpResponse<dynamic>> close();

  @POST('/api/seller/merchant/balance-top-up')
  Future<HttpResponse<dynamic>> topUpBalance(
    @Body() Map<String, dynamic> body,
  );
}
