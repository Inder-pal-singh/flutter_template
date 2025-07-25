import 'package:api_client/api_client.dart';
import 'package:app_storage/app_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/utils/app_config.dart';

class ContentProvider extends ApiClient {
  ContentProvider() : super(baseUrl: AppConfig.baseUrl);

  Future<ApiResponse> getContent(String type) async {
    final lang = AppStorage().appLanguage;
    final res = await get(
      '/api/content/$type',
      options: Options(headers: {'lang': lang}),
    );
    validateResponse(res);
    return ApiResponse.fromJson(res.data);
  }
}
