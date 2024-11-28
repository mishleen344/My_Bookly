import 'package:dio/dio.dart';

/// Abstract class for handling failures
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  /// Factory constructor to handle Dio exceptions
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the server.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the server.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was canceled.');

      case DioExceptionType.unknown:
        if (dioException.error != null &&
            dioException.error.toString().contains('SocketException')) {
          return ServerFailure('No internet connection.');
        }
        return ServerFailure('Unexpected error, please try again.');

      default:
        return ServerFailure('An unknown error occurred.');
    }
  }

  /// Factory constructor to handle HTTP responses
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (response is Map<String, dynamic> &&
        response.containsKey('error') &&
        response['error'] is Map<String, dynamic>) {
      final message = response['error']['message'];
      return ServerFailure(message ?? 'Unknown error occurred.');
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure('Authentication error. Please try again.');
      case 404:
        return ServerFailure('Resource not found. Please try later.');
      case 500:
        return ServerFailure('Internal server error. Please try later.');
      default:
        return ServerFailure('Unexpected error occurred. Please try again.');
    }
  }
}
