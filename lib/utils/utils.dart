import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ApiStatus { ok, error }

class ApiResponse {
  final ApiStatus? status;
  final String message;
  final dynamic data;

  ApiResponse(
      {required this.status, required this.message, required this.data});
  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(
        status: json?['status'] == "OK" ? ApiStatus.ok : ApiStatus.error,
        message: json?['message'] ?? json?['error'] ?? 'An error occurred',
        data: json?['data']);
  }

  // error message
  factory ApiResponse.error(String message) {
    return ApiResponse(status: ApiStatus.error, message: message, data: null);
  }
  factory ApiResponse.ok(String message, dynamic data) {
    return ApiResponse(status: ApiStatus.ok, message: message, data: data);
  }
}

validateResponse(Response response) {
  if (response.statusCode == 200) {
    return response.data;
  } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
    logger.e('Error: ${response.data}');
    throw response.data['message']?.toString() ??
        response.data['error'] ??
        "Server Error";
  }
  throw 'Server Error';
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
        statusBarBrightness: Brightness.dark),
  );
}

void setDarkStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light),
  );
}

String createFileName(String path, String suffix) {
  final ext = path.split('.').last;
  final filename = '${DateTime.now().millisecondsSinceEpoch}_$suffix.$ext';
  return filename;
}

String calculateAge(DateTime birthDate) {
  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust for the case where the birthday hasn't occurred yet this year
  if (months < 0) {
    years--;
    months += 12;
  }
  if (months == 0 && years == 0) {
    return '${days}d';
  }
  if (years == 0) {
    return '${months}m';
  }
  if (months == 0) {
    return '${years}y';
  }

  return '${years}y ${months}m';
}
