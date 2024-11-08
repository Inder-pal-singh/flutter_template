import 'package:app_logger/app_logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository = NotificationRepository();
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
    on<ListenToTokenChanges>(_listenToTokenChanges);
    add(const ListenToTokenChanges());
  }
  _listenToTokenChanges(
      ListenToTokenChanges event, Emitter<NotificationState> emit) async {
    logger.d('Listening to token changes');
    final token = await FirebaseMessaging.instance.getToken();
    logger.d('Token: $token');
    if (token != null) {
      logger.d('Updating token');
      repository.updateToken(token);
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      logger.d('FCM Token: $fcmToken');
      repository.updateToken(fcmToken);
    }).onError((err) {
      logger.e('Error getting token: $err');
    });
  }
}
