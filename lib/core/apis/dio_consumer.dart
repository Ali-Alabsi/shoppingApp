
import 'package:dio/dio.dart';

import '../error/error_exception.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio }){
    dio.options.baseUrl =EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      responseHeader: true
    ));
  }

  @override
  Future delete(String path,
      {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false
      }) async {
    try {
      final response =
          await dio.delete(path, data: isFormData?FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data, Map<String, dynamic>? queryParameters , bool isFormData = false }) async {
    try {
      final response =
          await dio.get(path, data: isFormData?FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters , bool isFormData = false }) async {
    try {
      final response =
          await dio.patch(path, data: isFormData?FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters , bool isFormData = false }) async {
    try {
      final response =
          await dio.post(path,  data: isFormData?FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
