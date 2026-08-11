import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_setting_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantSettingApiService {
  factory MerchantSettingApiService(Dio dio, {String baseUrl}) =
      _MerchantSettingApiService;

  @POST('/api/settings')
  Future<HttpResponse<dynamic>> getSetting(
    @Body() Map<String, dynamic> body,
  );
}
