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

// String toImageUrl(String? imageUrl) {
//   if (imageUrl == null) {
//     return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpCKq1XnPYYDaUIlwlsvmLPZ-9-rdK28RToA&usqp=CAU";
//   }
//   if (imageUrl.startsWith("http")) {
//     return imageUrl;
//   }
//   if (imageUrl.startsWith("/")) {
//     return S3Client.s3Endpoint + imageUrl;
//   }
//   return "${S3Client.s3Endpoint}/$imageUrl";
// }

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

// Future<void> shareSocial(List<String> imageUrls, String text) async {
//   try {
//     if (imageUrls.isEmpty) {
//       await Share.share(text);
//       return;
//     }

//     List<Future<XFile>> downloadFutures = imageUrls.map((imageUrl) async {
//       File? file;
//       final documentDirectory = (await getTemporaryDirectory()).path;
//       final filePath = '$documentDirectory/${imageUrl.split('/').last}';
//       // if (File(filePath).existsSync()) {
//       // file = File(filePath);
//       // } else {
//       final response = await http.get(Uri.parse(imageUrl));
//       file = File(filePath);
//       file.writeAsBytesSync(response.bodyBytes);
//       // }
//       return XFile(filePath);
//     }).toList();

//     // Wait for all images to download
//     List<XFile> xFiles = await Future.wait(downloadFutures);

//     // Share the images and text
//     await Share.shareXFiles(xFiles, text: text);
//   } catch (e) {
//     logger.e('Error sharing content: $e');
//   }
// }
