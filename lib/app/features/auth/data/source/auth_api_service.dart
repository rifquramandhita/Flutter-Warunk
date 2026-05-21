import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) => _AuthApiService(dio);

  @POST('/api/auth/login')
  Future<HttpResponse<dynamic>> login({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/api/seller/auth/register')
  Future<HttpResponse<dynamic>> register({
    @Body() required Map<String, dynamic> body,
  });
}
