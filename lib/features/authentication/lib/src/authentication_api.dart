import 'dart:developer';

import 'package:api_client/api_client.dart';

import '../../../../utils/app_config.dart';

class AuthApi extends ApiClient {
  AuthApi() : super(baseUrl: AppConfig.baseUrl);
  static const String _endpoint = '/api/auth';
  Future<ApiResponse> login({required String phone}) async {
    final response = await post('$_endpoint/login', data: {'phone': phone});
    log(response.data.toString());

    validateResponse(response);

    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> socialLogin({
    required String email,
    required String? firstName,
    required String? lastName,
    required String socialId,
    required String loginType,
  }) async {
    final response = await post(
      '$_endpoint/social-login',
      data: {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'socialId': socialId,
        'loginType': loginType,
      },
    );
    log(response.data.toString());

    validateResponse(response);

    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> changeEmailRequest({required String email}) async {
    final response = await post(
      '$_endpoint/change-email/send-otp',
      data: {'email': email},
    );
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> verifyChangeEmailOtp(Map<String, dynamic> otp) async {
    final response = await post(
      '$_endpoint/change-email/verify-otp',
      data: otp,
    );
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> changePhoneNumber(String phoneNumber) async {
    final response = await post(
      '$_endpoint/change-phone/send-otp',
      data: {'phone': phoneNumber},
    );
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> verifyPhoneNumber(String otp, String id) async {
    final response = await post(
      '$_endpoint/change-phone/verify-otp',
      data: {'otp': otp, 'id': id},
    );
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> verify(Map<String, dynamic> otp) async {
    log('Otp 5');
    log('otp $otp');
    final response = await post('$_endpoint/verify-otp', data: otp);
    log('res: $response');
    log('Otp 6');
    validateResponse(response);
    log(response.data.toString());
    // storagePref.storeToken(response.data['data']['token']);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> logOut() async {
    final response = await post('$_endpoint/logout');
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> deleteUser() async {
    final response = await post('/api/delete/create-job');
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse?> resendOtp(String id) async {
    final response = await post('$_endpoint/resend-otp', data: {'id': id});
    validateResponse(response);
    return ApiResponse.fromJson(response.data);
  }
}
