import 'package:dio/dio.dart';

dynamic validateResponse(Response response) {
  if (response.statusCode == 200) {
    return response.data;
  } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
    throw response.data['message']?.toString() ??
        response.data['error'] ??
        "Server Error";
  }

  throw Exception('Failed to load data');
}
