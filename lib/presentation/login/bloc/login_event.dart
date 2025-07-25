part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginPhoneSubmitted extends LoginEvent {
  const LoginPhoneSubmitted(this.phone);
  final String phone;

  @override
  List<Object> get props => [phone];
}

final class LoginOtpSubmitted extends LoginEvent {
  const LoginOtpSubmitted(this.otp);
  final String otp;

  @override
  List<Object> get props => [otp];
}

final class LoginResendOtp extends LoginEvent {}
