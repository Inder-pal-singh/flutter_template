import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class Notification {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final DateTime createdAt;

  Notification(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.createdAt});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
