import 'package:dio/dio.dart';
import '../errors/server_exception.dart';

class ApiErrorHandler {
  static ServerException handle(DioException error) {
    final response = error.response;

    if (response != null) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        return ServerException(
          message: data['message']?.toString() ?? 'Something went wrong',
          statusCode: response.statusCode,
        );
      }

      return ServerException(
        message: 'Server error',
        statusCode: response.statusCode,
      );
    }

    return ServerException(
      message: 'Network error. Please check your connection.',
    );
  }
}