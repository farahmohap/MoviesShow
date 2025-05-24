import 'package:dio/dio.dart';
import 'package:movies_show/core/networking/dio_factory.dart';

abstract class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(String path, {Map<String, dynamic>? params});
  Future<Response> post(String path, dynamic data);
}

class ApiServiceImpl implements ApiService {
  @override
  final Dio dio;

  ApiServiceImpl() : dio = DioFactory().dio;

  @override
  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    return await dio.get(path, queryParameters: params);
  }

  @override
  Future<Response> post(String path, dynamic data) async {
    return await dio.post(path, data: data);
  }
}