import 'package:dio/dio.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    queryParameters: {'api_key': ApiConstants.apiKey},
  ));

  Dio get dio => _dio;

  DioFactory() {
    _addInterceptors();
  }

 void _addInterceptors() {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: false,
      maxWidth: 90,
    ));
  }
}