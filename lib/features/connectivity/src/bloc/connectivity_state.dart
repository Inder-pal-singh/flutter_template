part of 'connectivity_bloc.dart';

final class ConnectivityState extends Equatable {
  const ConnectivityState({this.connectivityResult = ConnectivityResult.none});

  final ConnectivityResult connectivityResult;

  @override
  List<Object> get props => [connectivityResult];

  //copy with

  ConnectivityState copyWith({
    ConnectivityResult? connectivityResult,
  }) {
    return ConnectivityState(
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
}
