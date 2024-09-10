part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailSubmitted extends LoginEvent {
  const LoginEmailSubmitted(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

final class LoginOtpSubmitted extends LoginEvent {
  const LoginOtpSubmitted(this.otp);
  final String otp;

  @override
  List<Object> get props => [otp];
}

final class LoginResendOtp extends LoginEvent {}

