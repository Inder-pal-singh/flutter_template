import 'package:get_storage/get_storage.dart';

final AppStorage kPref = AppStorage();

class AppStorage {
  late final GetStorage _prefs = GetStorage();

  Future<void> storeToken(String? token) async {
    if (token == null) {
      throw Exception(
          'Unable to Store Token, Token != null && Token != "" is required.');
    }
    _prefs.write('token', token);
  }

  Future<void> deleteToken() async {
    _prefs.remove('token');
  }

  String? get token => _prefs.read('token');

  bool get languageSelected => _prefs.read('languageSelected') ?? false;

  String setLanguage(String code) {
    _prefs.write('language', code);
    _prefs.write('languageSelected', true);

    return code;
  }

  String get appLanguage {
    return _prefs.read('language') ?? "en";
  }

  bool isSubscribedToPushNotifications() {
    return _prefs.read('subscribedToPushNotifications') ?? false;
  }

  bool isSubscribedToEmailNotifications() {
    return _prefs.read('subscribedToEmailNotifications') ?? false;
  }

  bool setSubscribedToPushNotifications(bool value) {
    _prefs.write('subscribedToPushNotifications', value);
    return value;
  }

  bool setSubscribedToEmailNotifications(bool value) {
    _prefs.write('subscribedToEmailNotifications', value);
    return value;
  }

  bool isOnboardingCompleted() {
    return _prefs.read('onboardingCompleted') ?? false;
  }

  bool setOnboardingCompleted(bool value) {
    _prefs.write('onboardingCompleted', value);
    return value;
  }

  void clear() {
    _prefs.erase();
  }

  static Future<void> init() async {
    await GetStorage.init();
  }
}
