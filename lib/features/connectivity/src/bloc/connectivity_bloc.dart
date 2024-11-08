import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../data/connectivity_repository.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription<ConnectivityResult?>? _subscription;
  final ConnectivityRepository connectivityRepository;
  ConnectivityBloc({required this.connectivityRepository})
      : super(const ConnectivityState()) {
    on<ConnectivityEvent>((event, emit) async {
      try {
        List<ConnectivityResult> connectivityResults =
            await Connectivity().checkConnectivity();
        logger.d('Connectivity BLOC results: $connectivityResults');
        if (connectivityResults.contains(ConnectivityResult.none)) {
          emit(state.copyWith(connectivityResult: ConnectivityResult.none));
        } else {
          emit(state.copyWith(connectivityResult: connectivityResults.first));
        }
        _subscription = connectivityRepository.connectivity
            .listen((ConnectivityResult? result) {
          logger.d('Connectivity BLOC result: $result');

          if (result == ConnectivityResult.none) {
            add(const ConnectivityDisconnected());
          } else {
            add(ConnectivityConnected(
              connectivityResult: result ?? ConnectivityResult.none,
            ));
          }
        });
      } catch (e) {
        logger.e('Error in ConnectivityBloc: $e');
      }
    });

    on<ConnectivityDisconnected>(
        (ConnectivityDisconnected event, Emitter<ConnectivityState> emit) {
      emit(state.copyWith(connectivityResult: ConnectivityResult.none));
    });
    on<ConnectivityConnected>(
        (ConnectivityConnected event, Emitter<ConnectivityState> emit) {
      emit(state.copyWith(connectivityResult: event.connectivityResult));
    });
    add(const ConnectivityEvent());
  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
