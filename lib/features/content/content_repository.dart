import 'dart:async';

import 'package:app_logger/app_logger.dart';

import 'content.dart';

class ContentRepository {
  final ContentProvider provider = ContentProvider();
  Future<List<Content>> getContent(String type) async {
    try {
      final response = await provider.getContent(type);
      if (response.status == "OK") {
        final data =
            (response.data as List<dynamic>).map((e) => Content.fromJson(e));
        Iterable<Content> futureOrContentList = data;
        return futureOrContentList.toList();
      } else {
        throw Exception("Error ${response.message}");
      }
    } catch (e) {
      logger.e(e);
      throw Exception("Error $e");
    }
  }

  Future<Content> getSingleContent(String type) async {
    try {
      final response = await provider.getContent(type);
      if (response.status == "OK") {
        return Content.fromJson(response.data[0]);
      } else {
        throw Exception("Error ${response.message}");
      }
    } catch (e) {
      logger.e(e);
      throw Exception("Error $e");
    }
  }
}
