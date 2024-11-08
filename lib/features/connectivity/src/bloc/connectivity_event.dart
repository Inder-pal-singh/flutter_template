part of 'connectivity_bloc.dart';

final class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

final class ConnectivityDisconnected extends ConnectivityEvent {
  const ConnectivityDisconnected();

  @override
  List<Object> get props => [];
}

final class ConnectivityConnected extends ConnectivityEvent {
  const ConnectivityConnected({required this.connectivityResult});
  final ConnectivityResult connectivityResult;

  @override
  List<Object> get props => [connectivityResult];
}
