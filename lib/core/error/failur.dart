import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailre extends Failure {
  ServerFailre({required super.message});
  factory ServerFailre.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailre(
            message: "Connection timeout with server please try again later");
      case DioExceptionType.sendTimeout:
        return ServerFailre(message: "Send timeout please try again later");
      case DioExceptionType.cancel:
        return ServerFailre(message: "Request has been canceled try again");
      case DioExceptionType.receiveTimeout:
        return ServerFailre(message: "Recive timeout please try again later");
      case DioExceptionType.badCertificate:
        return ServerFailre(message: "Bad certificate error");
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 404) {
          return ServerFailre(
              message: "Request not found please try again later");
        } else if (error.response?.statusCode == 500) {
          return ServerFailre(
              message: "there is a server problem please try again later");
        } else if (error.response?.statusCode == 400) {
          return ServerFailre(message: error.response?.data["errors"]["login"]);
        } else if (error.response?.statusCode == 401) {
          return ServerFailre(message: "try login againg");
        } else {
          return ServerFailre(message: "Try again there was an error");
        }

      case DioExceptionType.connectionError:
        return ServerFailre(message: "No internet connection");

      case DioExceptionType.unknown:
        return ServerFailre(
            message: "there is something wrong please try again later");
    }
  }
}

class CachFailure extends Failure {
  CachFailure({required super.message});
}

class NetworkFailre extends Failure {
  NetworkFailre({required super.message});
}

class UnkownFailre extends Failure {
  UnkownFailre({required super.message});
}
