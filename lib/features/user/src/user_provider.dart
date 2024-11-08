import 'package:api_client/api_client.dart';
import 'package:app_logger/app_logger.dart';

import 'models/user.model.dart';

class UserApi extends ApiClient {
  static const String _endpoint = "/api/user";

  Future<ApiResponse?> getUser() async {
    final response = await get(_endpoint);
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> updateUser(User user) async {
    String timeZone = 'Europe/Berlin';
    final response = await dio.get(
      'https://api.ipgeolocation.io/ipgeo?apiKey=9b7856d6f8c040c7877aa9f62464adf9',
    );

    if (response.statusCode == 200) {
      final data = response.data;
      logger.d(data);
      timeZone = data['time_zone']['name']; // e.g., 'Africa/Abidjan'
    } else {
      throw Exception('Failed to get time zone');
    }

    final response2 = await put('$_endpoint/profile', data: {
      ...user.toJson(),
      'preferences': {
        'notifications': user.preferences.notifications
            .copyWith(
              timezone: timeZone,
            )
            .toJson(),
        'locale': user.preferences.locale,
      }
    });
    validateResponse(response2);
    return ApiResponse.fromJson(response2.data);
  }
}
