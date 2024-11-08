import 'dart:async';

import 'package:app_storage/app_storage.dart';

import '../app_locale.dart';

class AppLocaleRepository {
  final AppStorage preferences = AppStorage();
  late StreamController<Language> _controller;

  AppLocaleRepository() {
    _controller = StreamController<Language>();
  }
  Stream<Language> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    yield* _controller.stream;
  }

  Future<void> changeLanguage(Language language) async {
    preferences.setLanguage(language.locale.languageCode);
    _controller.add(language);
  }

  void dispose() {
    _controller.close();
  }
}
