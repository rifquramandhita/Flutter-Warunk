import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_order_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantOrderApiService {
  factory MerchantOrderApiService(Dio dio, {String baseUrl}) =
      _MerchantOrderApiService;

  @GET(MERCHANT_ORDERS)
  Future<HttpResponse<dynamic>> getOrders();

  @GET('$MERCHANT_ORDERS/{id}')
  Future<HttpResponse<dynamic>> getOrderById(@Path('id') String id);

  @POST('$MERCHANT_ORDERS/{id}/accept')
  Future<HttpResponse<dynamic>> acceptOrder(@Path('id') String id);

  @POST('$MERCHANT_ORDERS/{id}/ship')
  Future<HttpResponse<dynamic>> shipOrder(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('$MERCHANT_ORDERS/{id}/received')
  Future<HttpResponse<dynamic>> receivedOrder(@Path('id') String id);

  @POST('$MERCHANT_ORDERS/{id}/reject')
  Future<HttpResponse<dynamic>> rejectOrder(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );
}
