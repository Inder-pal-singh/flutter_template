import 'notification_provider.dart';

class NotificationRepository {
  final NotificationProvider _notificationProvider = NotificationProvider();
  Future<void> updateToken(String token) async {
    await _notificationProvider.updateToken(token);
  }
}
