part of 'user_bloc.dart';

final class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class UserFetchEvent extends UserEvent {
  const UserFetchEvent();
  @override
  List<Object> get props => [];
}

final class UserFetchedEvent extends UserEvent {
  final User? user;
  const UserFetchedEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

final class UpdateUserEvent extends UserEvent {
  final User user;
  const UpdateUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}

final class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent();
  @override
  List<Object> get props => [];
}

final class UserUpdateProfileEvent extends UserEvent {
  final User user;
  const UserUpdateProfileEvent({required this.user});
  @override
  List<Object> get props => [user];
}
