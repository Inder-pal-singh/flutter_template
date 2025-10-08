import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepository {
  late final StreamController<ConnectivityResult> _connectivityStream;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityRepository() {
    _connectivityStream = StreamController<ConnectivityResult>.broadcast();
    logger.i('Connectivity Repository initialized');
    final connectivity = Connectivity();

    _subscription = connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _connectivityStream.add(result.first);
    });
  }

  Stream<ConnectivityResult> get connectivity {
    return _connectivityStream.stream;
  }

  void dispose() {
    _subscription.cancel();
    _connectivityStream.close();
  }
}
