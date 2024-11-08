import 'package:json_annotation/json_annotation.dart';

part 'notification_preferences.model.g.dart';

@JsonSerializable()
class NotificationPreferences {
  final bool isOn;
  final int frequency;
  final String timezone;
  final String? sendTime;

  NotificationPreferences(
      {required this.isOn,
      required this.frequency,
      required this.timezone,
      required this.sendTime});

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPreferencesToJson(this);

  NotificationPreferences copyWith({
    bool? isOn,
    int? frequency,
    String? timezone,
    String? time,
  }) {
    return NotificationPreferences(
      isOn: isOn ?? this.isOn,
      frequency: frequency ?? this.frequency,
      timezone: timezone ?? this.timezone,
      sendTime: time ?? sendTime,
    );
  }
}
