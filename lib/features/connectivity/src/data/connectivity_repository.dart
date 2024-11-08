import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepository {
  late StreamController<ConnectivityResult>? _connectivityStream;

  ConnectivityRepository() {
    _connectivityStream = StreamController<ConnectivityResult>();
    logger.i('Connectivity Repository initialized');
    final connectivity = Connectivity();

    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      logger.d('Connectivity changed: $result');
      _connectivityStream!.add(result.first);
    });
  }

  Stream<ConnectivityResult?> get connectivity async* {
    logger.d('Connectivity Repository get connectivity ');
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _connectivityStream!.stream;
  }
}
