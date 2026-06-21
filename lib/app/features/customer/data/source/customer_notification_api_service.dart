import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_notification_api_service.g.dart';

@RestApi()
abstract class CustomerNotificationApiService {
  factory CustomerNotificationApiService(Dio dio, {String baseUrl}) = _CustomerNotificationApiService;

  @GET('/api/notifications')
  Future<HttpResponse<dynamic>> getNotifications({
    @Query('page') int? page,
  });
}
