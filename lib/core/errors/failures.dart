import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error , please try again');
    }
  }
}

class SercerFailure extends Failure {
  SercerFailure(super.message);

  factory SercerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return SercerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return SercerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return SercerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return SercerFailure('badCertificate with api server');
      case DioExceptionType.badResponse:
        return SercerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return SercerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return SercerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return SercerFailure('Opps There was an Error, Please try again');
    }
  }

  factory SercerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return SercerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return SercerFailure('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return SercerFailure(response['error']['message']);
    } else {
      return SercerFailure('There was an error , please try again');
    }
  }
}
