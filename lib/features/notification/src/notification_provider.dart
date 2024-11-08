import 'package:api_client/api_client.dart';

class NotificationProvider extends ApiClient {
  static const String _endpoint = "/api/notifications/";
  Future<ApiResponse> getNotifications() async {
    final response = await get(_endpoint);
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> updateToken(String token) async {
    final response =
        await post("$_endpoint/update-token", data: {"token": token});
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }
}
