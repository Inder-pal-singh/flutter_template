import 'package:api_client/api_client.dart';
import 'package:app_storage/app_storage.dart';
import 'package:dio/dio.dart';

class ContentProvider extends ApiClient {
  Future<ApiResponse> getContent(String type) async {
    final lang = AppStorage().appLanguage;
    final res = await get('/api/content/$type',
        options: Options(
          headers: {'lang': lang},
        ));
    validateResponse(res);
    return ApiResponse.fromJson(res.data);
  }
}
