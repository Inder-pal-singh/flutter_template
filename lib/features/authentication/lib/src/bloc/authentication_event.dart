part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}

final class UpdateNotificationPreferences extends AuthenticationEvent {
  const UpdateNotificationPreferences(this.isNotificationEnabled);

  final bool isNotificationEnabled;
  List<Object> get props => [isNotificationEnabled];
}
