import 'dart:async';
import 'dart:developer';

import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';

import 'authentication_api.dart';
import 'models/otp_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final AppStorage preferences = AppStorage();
  late StreamController<AuthenticationStatus> _controller;

  OtpModel? _otp;

  String get otp => _otp?.otp ?? '';
  final AuthApi _authApi = AuthApi();

  AuthenticationRepository() {
    _controller = StreamController<AuthenticationStatus>();
    _controller.add(AuthenticationStatus.unknown);
    final token = preferences.token;
    if (token != null) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  Future<void> login({required String phone}) async {
    final res = await _authApi.login(phone: phone);
    _otp = OtpModel.fromJson(res.data!);

    log('otp: ${_otp!.otp}');
  }

  Future<void> socialLogin({
    required String email,
    required String? firstName,
    required String? lastName,
    required String socialId,
    required String loginType,
  }) async {
    final res = await _authApi.socialLogin(
      email: email,
      firstName: firstName,
      lastName: lastName,
      socialId: socialId,
      loginType: loginType,
    );
    preferences.storeToken(res.data!['token']);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> changeEmailRequest({required String email}) async {
    final res = await _authApi.changeEmailRequest(email: email);
    if (res.status == 'OK') {
      _otp = OtpModel.fromJson(res.data!);
    } else {
      logger.e('Error changing email: ${res.message}');
      throw res.message!;
    }

    logger.d('SAMPLE- otp: ${_otp!.otp}');

    // _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> verifyOtp({required String otp}) async {
    logger.d('Otp 2');
    _otp?.otp = otp;
    log(_otp.toString());
    final res = await _authApi.verify(_otp!.toJson());
    log('Otp 3');
    log('res: $res');
    preferences.storeToken(res.data!['token']);
    log(res.data['token']);
    _controller.add(AuthenticationStatus.authenticated);
    log('status: ${_controller.stream}');
  }

  Future<bool> changeEmailVerifyOtp({required String otp}) async {
    _otp!.otp = otp;
    final res = await _authApi.verifyChangeEmailOtp({
      ..._otp!.toJson(),
      'id': _otp!.id,
    });
    if (res.status == 'OK') {
      preferences.storeToken(res.data!['token']);
      _controller.add(AuthenticationStatus.authenticated);
      return true;
    } else {
      logger.e('Error changing email: ${res.message}');
      throw res.message!;
    }
  }

  Future<OtpModel?> changePhoneRequestOTP(String phoneNumber) async {
    final res = await _authApi.changePhoneNumber(phoneNumber);
    return OtpModel.fromJson(res!.data!);
  }

  Future<bool?> changePhoneVerifyOTP(String otp, String id) async {
    final res = await _authApi.verifyPhoneNumber(otp, id);
    if (res.status == 'OK') {
      preferences.storeToken(res.data!['token']);
      _controller.add(AuthenticationStatus.authenticated);
      return true;
    } else {
      logger.e('Error changing email: ${res.message}');
      throw res.message!;
    }
  }

  Future<void> logOut() async {
    await _authApi.logOut();
    preferences.clear();
    preferences.setOnboardingCompleted(true);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<bool> deleteUser() async {
    try {
      final res = await _authApi.deleteUser();
      logger.d("RES Stats ${res?.status}");
      if (res?.status == "OK") {
        preferences.clear();
        _controller.add(AuthenticationStatus.unauthenticated);
        // await logOut();
        return true;
      }
      return true;
    } catch (e) {
      logger.e('Error deleting user: $e');
    }
    return false;
  }

  Future<void> resendOtp() async {
    final res = await _authApi.resendOtp(_otp!.id);
    if (res?.status == 'OK') {
      _otp = OtpModel.fromJson(res!.data!);
    }
  }

  void dispose() => _controller.close();
}
