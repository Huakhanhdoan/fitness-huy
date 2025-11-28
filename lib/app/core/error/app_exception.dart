import 'dart:io';

import 'package:base_project_flutter/gen/l10n/generated/l10n.dart';
import 'package:dio/dio.dart';

enum AppExceptionType {
  network,
  mapping,
  unauthorized,
  forbidden,
  cancel,
  timeout,
  server,
  serverRetry,
  serverValidate,
  invalidInput,
  maintenance,
  notFound,
  gone,
  unknown,
}

class AppException implements Exception {
  final AppExceptionType type;
  final String message;
  final dynamic error;
  final String? title;
  final int? headerCode;
  final StackTrace? stackTrace;

  static Map<String, String> serverErrors = {};

  AppException(
    this.type,
    this.message, {
    this.error,
    this.title,
    this.headerCode,
    this.stackTrace,
  });

  factory AppException.invalidInput(String message) {
    return AppException(AppExceptionType.invalidInput, message);
  }

  factory AppException.fromException(Exception exception) {
    var type = AppExceptionType.unknown;
    String? message = '';
    String? title;
    int? headerCode;
    StackTrace? stackTrace;

    // Handle error when call API
    if (exception is DioException) {
      message = exception.response?.statusMessage ?? exception.message;
      headerCode = exception.response?.statusCode ?? -1;

      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppExceptionType.timeout;
          message = S.current.common_error_message;
          break;
        case DioExceptionType.sendTimeout:
          type = AppExceptionType.network;
          message = S.current.network_error;
          break;
        case DioExceptionType.cancel:
          type = AppExceptionType.cancel;
          break;
        case DioExceptionType.unknown:
        default:
          switch (headerCode) {
            case HttpStatus.unprocessableEntity: // 422
              type = AppExceptionType.serverValidate;
              break;
            case HttpStatus.unauthorized: // 401
              type = AppExceptionType.unauthorized;
              break;
            case HttpStatus.forbidden: // 403
              type = AppExceptionType.forbidden;
              break;
            case HttpStatus.serviceUnavailable: // 503 - Maintain
              type = AppExceptionType.maintenance;
              break;
            case HttpStatus.gone: // 503 - Maintain
              type = AppExceptionType.gone;
              break;
            case HttpStatus.notFound: // 404
              type = AppExceptionType.notFound;
              break;
            default:
              type = AppExceptionType.server;
              break;
          }

          final response = exception.response;

          if (response != null) {
            try {
              // todo: custom error response for each project
            } catch (e) {
              return AppException(
                type,
                S.current.server_error_message,
                title: title,
                error: e,
                headerCode: headerCode,
                stackTrace: stackTrace,
              );
            }
          }
          break;
      }
    } else {
      type = AppExceptionType.unknown;
      message = 'AppException: $exception';
    }

    return AppException(
      type,
      message ?? '',
      title: title,
      error: exception,
      headerCode: headerCode,
      stackTrace: stackTrace,
    );
  }

  factory AppException.fromError(Error error) {
    return AppException(
      AppExceptionType.unknown,
      S.current.common_error_message,
      error: error,
      headerCode: null,
      stackTrace: error.stackTrace,
    );
  }

  static void initServerError() {
    serverErrors = {
      'S-0001': S.current.s_0001,
    };
  }

  @override
  String toString() {
    return '${type.name}: $message';
  }
}
