import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/features/authentication/lib/app_authentication.dart';

import '../../../utils/enums.dart';
import '../../../utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const LoginState._()) {
    on<LoginPhoneSubmitted>(_onLoginEmailSubmitted);
    on<LoginOtpSubmitted>(_onLoginOtpSubmitted);
    on<LoginResendOtp>(_onLoginResendOtp);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onLoginEmailSubmitted(
    LoginPhoneSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.inProgress));
    try {
      await _authenticationRepository.login(phone: event.phone);
      emit(state.copyWith(formStatus: FormStatus.formSubmitted));
    } catch (e) {
      String error = 'Something went wrong!';
      FormStatus formStatus = FormStatus.error;
      if (e is DioException) {
        final DioException dioError = e;
        formStatus = isServerError(e)
            ? FormStatus.serverError
            : FormStatus.error;
        error =
            e.response?.data['message'] ?? dioError.error ?? dioError.message;
      } else {
        error = e.toString();
      }
      emit(state.copyWith(error: error, formStatus: formStatus));
    }
  }

  Future<void> _onLoginOtpSubmitted(
    LoginOtpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.inProgress));
    try {
      await _authenticationRepository.verifyOtp(otp: event.otp);

      emit(state.copyWith(formStatus: FormStatus.otpSubmitted));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), formStatus: FormStatus.error));
      // }
    }
  }

  Future<void> _onLoginResendOtp(
    LoginResendOtp event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.inProgress));
    try {
      // await _authenticationRepository.resendOtp();
      // emit(state.copyWith(
      //   formStatus: FormStatus.otpResent,
      // ));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), formStatus: FormStatus.error));
    }
  }
}
