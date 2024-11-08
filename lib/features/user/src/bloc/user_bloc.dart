import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/enums.dart';
import '../models/user.model.dart';
import '../user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  StreamSubscription<User?>? _userSubscription;
  UserBloc({required this.userRepository}) : super(const UserState()) {
    _userSubscription = userRepository.user.listen((user) {
      add(UserFetchedEvent(user: user));
    });
    on<UserFetchEvent>(_onUserFetch);
    on<UserFetchedEvent>(_onUserFetched);
    on<UpdateUserEvent>(_onUserUpdate);
    on<UserUpdateProfileEvent>(_onUserUpdateProfile);
  }

  void dispose() {
    _userSubscription?.cancel();
  }

  void _onUserFetch(UserFetchEvent event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));

      final user = await userRepository.getUser(user: state.user);
      if (user != null) {
        emit(state.copyWith(user: user, status: BlocStatus.loaded));
        return;
      }
      if (user == null && state.user == null) {
        throw Exception('Unable to fetch user');
      }
      if (user == null && state.user != null) {
        emit(state.copyWith(user: state.user, status: BlocStatus.loaded));
      }
    } catch (e) {
      logger.f('Error fetching user: $e');
      emit(state.copyWith(
        user: null,
        status: BlocStatus.error,
      ));
    }
  }

  void _onUserFetched(UserFetchedEvent event, Emitter<UserState> emit) {
    emit(state.copyWith(
      user: event.user,
    ));
  }

  void _onUserUpdate(UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(user: event.user));
    final user = await userRepository.updateUser(event.user);
    if (user != null) {
      emit(state.copyWith(user: user));
    }
  }

  void _onUserUpdateProfile(
      UserUpdateProfileEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(user: event.user));
  }
}
