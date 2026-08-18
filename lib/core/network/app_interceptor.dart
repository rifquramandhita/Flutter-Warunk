import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/main.dart';
import 'package:warunk/core/bloc/auth/auth_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';

class AppInterceptor extends Interceptor {
  dynamic _removeRuntimeType(dynamic data) {
    if (data is Map) {
      final newMap = <String, dynamic>{};
      data.forEach((key, value) {
        if (key != 'runtimeType') {
          newMap[key] = _removeRuntimeType(value);
        }
      });
      return newMap;
    } else if (data is List) {
      return data.map((item) => _removeRuntimeType(item)).toList();
    }
    return data;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = (isProduction) ? BASE_URL_PROD : BASE_URL_DEV;
    options.headers['accept'] = 'application/json';
    final authToken = await SharedPreferencesHelper.getString(PREF_AUTH);
    if (authToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }

    // Only perform JSON operations if the data is not FormData.
    if (options.data != null && options.data is! FormData) {
      // This will find all objects with a `toJson()` method and serialize them correctly.
      final serializedData = jsonDecode(jsonEncode(options.data));
      // Then, we recursively remove any 'runtimeType' fields that might have been added
      // during a non-standard serialization process.
      options.data = _removeRuntimeType(serializedData);
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      return handler.resolve(
        Response(data: response.data, requestOptions: response.requestOptions),
      );
    }
    super.onResponse(response, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await SharedPreferencesHelper.clearAll();
      sl<AuthBloc>().add(AuthEventCheck());
      
      // Tunggu sebentar agar AuthBloc selesai mengupdate state (isAuthenticated = false)
      // Hal ini mencegah race condition di mana halaman yang di-pop masih mendeteksi user login
      // dan berpotensi memanggil SystemNavigator.pop() yang menutup aplikasi.
      await Future.delayed(const Duration(milliseconds: 200));
      
      if (navigatorKey.currentState?.mounted ?? false) {
        navigatorKey.currentState?.popUntil((route) => route.isFirst);
      }
    }
    super.onError(err, handler);
  }
}
