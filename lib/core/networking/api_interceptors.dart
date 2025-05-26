import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptors extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('Response: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('Error: ${err.message}');
    }
    super.onError(err, handler);
  }
}