import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_basic/app/log.dart';
import 'package:flutter_basic/app/network/exceptions/api_exception.dart';
import 'package:flutter_basic/app/network/exceptions/app_exception.dart';
import 'package:flutter_basic/app/network/exceptions/network_exception.dart';
import 'package:flutter_basic/app/network/exceptions/not_found_exception.dart';
import 'package:flutter_basic/app/network/exceptions/service_unavailable_exception.dart';
import 'package:flutter_basic/app/network/exceptions/unauthorize_exception.dart';

Exception handleError(String error) {

  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.connectTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.other:
      return NetworkException("There is no internet connection");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.response:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {

  int statusCode = dioError.response?.statusCode ?? -1;
  String? serverMessage;

  try {
    serverMessage = dioError.response?.statusMessage;
  } catch (e) {
    Log.error(e.toString());
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "Not found", "");
    case HttpStatus.unauthorized:
      return UnauthorizedException(serverMessage ?? "You are not authorized to perform this operation");
    default:
      return ApiException(
          httpCode: statusCode,
          status: "",
          message: serverMessage ?? "Something went wrong! Try again later");
  }
}
