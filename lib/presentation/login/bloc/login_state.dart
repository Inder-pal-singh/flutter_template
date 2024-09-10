part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState._({
    this.formStatus = FormStatus.unknown,
    this.error,
  });

  final FormStatus formStatus;

  final String? error;

  LoginState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    String? error,
  }) {
    return LoginState._(
      formStatus: formStatus ?? this.formStatus,
      error: error,
    );
  }

  @override
  List<Object> get props => [
        formStatus,
      ];
}
