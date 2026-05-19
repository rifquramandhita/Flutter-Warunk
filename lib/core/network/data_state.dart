import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/network/base_response.dart';

class DataState<T> extends BaseResponse {
  final T? data;

  DataState({required super.success, required super.message, this.data});

  factory DataState.fromJson(Map<String, dynamic> json) {
    return DataState(
      success: json['success'],
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}

class SuccessState<T> extends DataState<T> {
  SuccessState({T? data, String message = 'Success'})
    : super(success: true, message: message, data: data);
}

class ErrorState<T> extends DataState<T> {
  ErrorState({required String message})
    : super(success: false, message: message);

  factory ErrorState.fromJson(Map<String, dynamic> json) {
    String mainMessage = json['message'] ?? 'An unknown error occurred';

    if (json['errors'] != null && json['errors'] is Map) {
      final errors = json['errors'] as Map<String, dynamic>;
      final errorMessages = errors.entries.map((entry) {
        final List<dynamic> messages = entry.value;
        return messages.join(', ');
      }).toList();

      if (errorMessages.isNotEmpty) {
        mainMessage += ':\n- ${errorMessages.join('\n- ')}';
      }
    }

    return ErrorState(message: mainMessage);
  }
}

Future<DataState<T>> handleResponse<T>(
  Future<HttpResponse<dynamic>> Function() apiCall,
  T Function(dynamic) mapDataSuccess,
) async {
  try {
    final HttpResponse<dynamic> httpResponse = await apiCall();
    final statusCode = httpResponse.response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300) {
      final json = httpResponse.data as Map<String, dynamic>;
      final message = json['message'] as String? ?? '';
      final data = await mapDataSuccess(json['data']);
      return SuccessState(data: data, message: message);
    } else {
      throw DioException(
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
      );
    }
  } on DioException catch (e) {
    try {
      final errorJson = jsonDecode(e.response.toString());
      final errorResponse = ErrorState.fromJson(errorJson);

      final statusCodeMessage =
          '${e.response?.statusCode ?? ''} ${errorResponse.message}';

      return ErrorState(message: statusCodeMessage);
    } catch (e1) {
      return ErrorState(
        message:
            '${e.response?.statusCode ?? HttpStatus.badRequest} ${e.error ?? e}',
      );
    }
  } catch (e) {
    return ErrorState(message: e.toString());
  }
}
