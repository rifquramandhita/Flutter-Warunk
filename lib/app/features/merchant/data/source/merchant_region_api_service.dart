import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_region_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantRegionApiService {
  factory MerchantRegionApiService(Dio dio, {String baseUrl}) =
      _MerchantRegionApiService;

  @GET('/api/regions/provinces')
  Future<HttpResponse<dynamic>> getProvinces();

  @GET('/api/regions/provinces/{provinceId}/regencies')
  Future<HttpResponse<dynamic>> getRegencies(
    @Path('provinceId') String provinceId,
  );

  @GET('/api/regions/regencies/{regencyId}/districts')
  Future<HttpResponse<dynamic>> getDistricts(
    @Path('regencyId') String regencyId,
  );
}
