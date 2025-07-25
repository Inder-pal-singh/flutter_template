import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ApiStatus { ok, error }

class ApiResponse {
  final ApiStatus? status;
  final String message;
  final dynamic data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(
      status: json?['status'] == "OK" ? ApiStatus.ok : ApiStatus.error,
      message: json?['message'] ?? json?['error'] ?? 'An error occurred',
      data: json?['data'],
    );
  }

  // error message
  factory ApiResponse.error(String message) {
    return ApiResponse(status: ApiStatus.error, message: message, data: null);
  }
  factory ApiResponse.ok(String message, dynamic data) {
    return ApiResponse(status: ApiStatus.ok, message: message, data: data);
  }
}

bool isServerError(DioException e) {
  return e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.cancel;
}

void setLightStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

void setDarkStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
}
