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

  @POST('/api/auth/login/google')
  Future<HttpResponse<dynamic>> loginGoogle({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/api/auth/register')
  Future<HttpResponse<dynamic>> registerCustomer({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/api/seller/auth/register')
  Future<HttpResponse<dynamic>> registerMerchant({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/api/auth/forgot-password')
  Future<HttpResponse<dynamic>> forgotPassword({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/api/auth/reset-password')
  Future<HttpResponse<dynamic>> resetPassword({
    @Body() required Map<String, dynamic> body,
  });
}
