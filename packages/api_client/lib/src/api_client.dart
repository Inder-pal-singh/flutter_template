import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiClient {
  // String baseurl = "http://172.20.10.5:3001";
  String baseurl = kReleaseMode
      ? "https://mvp-keewee-moment.net17solutions.com"
      // : 'http://172.20.10.5:3001';
      : "http://192.168.29.3:3001";

  AppStorage preferences = AppStorage();
  final dio = Dio();
  ApiClient() {
    dio.options = BaseOptions(
      baseUrl: baseurl,
      sendTimeout: const Duration(seconds: 25),
      receiveTimeout: const Duration(seconds: 25),
      validateStatus: (status) {
        return status != null && status < 500;
      },
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${preferences.token}';
        options.headers['lang'] = preferences.appLanguage;
        logger.d('Request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.d('Response: ${response.data} ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        Sentry.captureException(e, stackTrace: e.stackTrace);
        if (e.type == DioExceptionType.connectionTimeout) {
          throw DioException(
            message: 'The connection timed out',
            type: DioExceptionType.connectionTimeout,
            requestOptions: e.requestOptions,
          );
        } else if (e.type == DioExceptionType.sendTimeout) {
          throw DioException(
            message: 'The server took too long to respond',
            type: DioExceptionType.sendTimeout,
            requestOptions: e.requestOptions,
          );
        } else if (e.type == DioExceptionType.receiveTimeout) {
          throw DioException(
            message: 'The server took too long to respond',
            type: DioExceptionType.receiveTimeout,
            requestOptions: e.requestOptions,
          );
        } else if (e.type == DioExceptionType.cancel) {
          throw DioException(
            message: 'The request was cancelled',
            type: DioExceptionType.cancel,
            requestOptions: e.requestOptions,
          );
        } else if (e.type == DioExceptionType.connectionError) {
          throw DioException(
            message: 'Unable to connect to the server',
            type: DioExceptionType.cancel,
            requestOptions: e.requestOptions,
          );
        } else {
          throw DioException(
            message: 'Something went wrong',
            type: DioExceptionType.unknown,
            requestOptions: e.requestOptions,
          );
        }
        // return handler.next(e);
      },
    ));
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return dio.get(path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return dio.post(path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return dio.put(path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken}) {
    return dio.delete(path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken);
  }
}
