import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'customer_profil_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class CustomerProfilApiService {
  factory CustomerProfilApiService(Dio dio, {String baseUrl}) =
      _CustomerProfilApiService;

  @GET('/api/auth/profile')
  Future<HttpResponse<dynamic>> get();

  @MultiPart()
  @PUT('/api/auth/profile')
  Future<HttpResponse<dynamic>> update(
    @Part(name: 'photo') File? photo,
    @Part(name: 'name') String name,
    @Part(name: 'email') String email,
    @Part(name: 'phone') String phone,
    @Part(name: 'gender') String? gender,
    @Part(name: 'birth_date') String? birthDate,
  );
}
