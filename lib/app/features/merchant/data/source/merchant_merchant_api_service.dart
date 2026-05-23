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
}
