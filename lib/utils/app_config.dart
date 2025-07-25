import 'package:flutter/foundation.dart';

class AppConfig {
  static const String appName = 'Flutter Template';
  static const String baseUrl = kReleaseMode
      ? "https://mvp-keewee-moment.net17solutions.com"
      // : 'http://172.20.10.5:3001';
      : "http://192.168.29.3:3001";
}
