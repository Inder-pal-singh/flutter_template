import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';

import 'authentication_provider.dart';
import 'models/otp_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final AppStorage preferences = AppStorage();
  late StreamController<AuthenticationStatus> _controller;

  OtpModel? _otp;

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

  Future<void> login({
    required String email,
  }) async {
    final res = await _authApi.login(email: email);
    _otp = OtpModel.fromJson(res.data!);
  }

  Future<void> register({
    required String email,
    required String name,
    required String surName,
  }) async {
    final res = await _authApi.register(
      email: email,
      name: name,
      surName: surName,
    );
    _otp = OtpModel.fromJson(res.data!);

    logger.d('SAMPLE- otp: ${_otp!.otp}');

    // _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> changeEmailRequest({
    required String email,
  }) async {
    final res = await _authApi.changeEmailRequest(
      email: email,
    );
    if (res.status == "OK") {
      _otp = OtpModel.fromJson(res.data!);
    } else {
      logger.e('Error changing email: ${res.message}');
      throw res.message!;
    }

    logger.d('SAMPLE- otp: ${_otp!.otp}');

    // _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> verifyOtp({
    required String otp,
  }) async {
    _otp!.otp = otp;
    final res = await _authApi.verify(_otp!.toJson());

    preferences.storeToken(res.data!['token']);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<bool> changeEmailVerifyOtp({
    required String otp,
    required String email,
  }) async {
    _otp!.otp = otp;
    final res = await _authApi
        .verifyChangeEmailOtp({..._otp!.toJson(), 'email': email});
    if (res.status == "OK") {
      preferences.storeToken(res.data!['token']);
      _controller.add(AuthenticationStatus.authenticated);
      return true;
    } else {
      logger.e('Error changing email: ${res.message}');
      throw res.message!;
    }
  }

  void logOut() {
    preferences.clear();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<bool> deleteUser() async {
    try {
      final res = await _authApi.deleteUser();
      if (res?.status == "OK") {
        logOut();
        return true;
      }
      return true;
    } catch (e) {
      logger.e('Error deleting user: $e');
    }
    return false;
  }

  void dispose() => _controller.close();
}
