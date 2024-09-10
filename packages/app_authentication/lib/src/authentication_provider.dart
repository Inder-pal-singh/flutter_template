import 'package:api_client/api_client.dart';

class AuthApi extends ApiClient {
  static const String _endpoint = "/api/auth";
  Future<ApiResponse> login({
    required String email,
  }) async {
    final response = await post('$_endpoint/login', data: {
      'email': email,
    });
    validateResponse(response);

    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> register({
    required String name,
    required String surName,
    required String email,
  }) async {
    final response = await post('$_endpoint/register', data: {
      'name': name,
      'surName': surName,
      'email': email,
    });
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> changeEmailRequest({
    required String email,
  }) async {
    final response = await post('$_endpoint/change-email/send-otp', data: {
      'email': email,
    });
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> verifyChangeEmailOtp(Map<String, dynamic> otp) async {
    final response =
        await post('$_endpoint/change-email/verify-otp', data: otp);
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> verify(Map<String, dynamic> otp) async {
    final response = await post('$_endpoint/verify-otp', data: otp);
    validateResponse(response);
    // storagePref.storeToken(response.data['data']['token']);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> deleteUser() async {
    final response = await post("/api/delete/create-job");
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }
}
