import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import 'api_error_handler.dart';

class DioHelper {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  Future<Response> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try{
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
    } on DioException catch(e){
      throw ApiErrorHandler.handle(e);
    }

  }

  Future<Response> post(
      String endpoint, {
        dynamic data,
      }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
      );
    } on DioException catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }
}
