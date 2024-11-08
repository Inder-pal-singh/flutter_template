part of 'user_bloc.dart';

final class UserState extends Equatable {
  const UserState({this.user, this.status = BlocStatus.initial});

  final User? user;
  final BlocStatus status;
  @override
  List<Object?> get props => [user, status];

  UserState copyWith({
    User? user,
    BlocStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
