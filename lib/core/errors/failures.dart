import 'package:dio/dio.dart';

abstract class Failures{
  String errorMessage;
  Failures(this.errorMessage);
}

class ServerSideError extends Failures{
  ServerSideError(super.errorMessage);

  factory ServerSideError.fromDioException(DioException dioException){
    switch(dioException.type){
      case DioExceptionType.connectionTimeout:
        return ServerSideError('Connection Timeout, Check Your Internet and try again');
      case DioExceptionType.sendTimeout:
        return ServerSideError('Send Timeout, Check Your Internet and try again');
      case DioExceptionType.receiveTimeout:
        return ServerSideError('Receive Timeout, Check Your Internet and try again');
      case DioExceptionType.badCertificate:
        return ServerSideError('Bad Certificate, Please Try again Later or contact Support');
      case DioExceptionType.badResponse:
        return ServerSideError._badResponseFromDioExcpetion(dioException);
      case DioExceptionType.cancel:
        return ServerSideError('Your Request Cancelled Try Again');
      case DioExceptionType.connectionError:
        return ServerSideError('Connection Error, Check Your Connection and Try again Later or contact Support');
      case DioExceptionType.unknown:
        return ServerSideError('Oops, There is an Unknown Error, Try Later Or Contact Our Support');
    }
  }

  factory ServerSideError._badResponseFromDioExcpetion(DioException dioException){
    int responseCode = dioException.response!.statusCode!;
     if (responseCode == 404){
      return ServerSideError('Not Found, Error 404, Please Try again Later or contact our support');

    }else if (responseCode == 403) {
       return ServerSideError(
           'Your email did not verified yet please open you email and verify your email then try again');
     }else if (responseCode == 500){
      return ServerSideError('Internal Server Error, Please Try again Later or contact our support');

    }else{
      return ServerSideError(dioException.response?.data['ErrorMessage'] ?? 'Oops, There is an Unknown Error, Try Later Or Contact Our Support');

    }
  }

}