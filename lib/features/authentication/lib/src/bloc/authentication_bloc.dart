import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);

    _authenticationStatusSubscription = _authenticationRepository.status
        .listen((status) => add(_AuthenticationStatusChanged(status)));
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();

    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(const AuthenticationState.authenticated());
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }
}
