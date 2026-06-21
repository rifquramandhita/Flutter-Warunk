import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'merchant_notification_api_service.g.dart';

@RestApi()
abstract class MerchantNotificationApiService {
  factory MerchantNotificationApiService(Dio dio, {String baseUrl}) = _MerchantNotificationApiService;

  @GET('/api/seller/notifications')
  Future<HttpResponse<dynamic>> getNotifications({
    @Query('page') int? page,
  });
}
