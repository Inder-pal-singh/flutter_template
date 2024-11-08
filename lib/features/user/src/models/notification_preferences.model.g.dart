// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPreferences _$NotificationPreferencesFromJson(
        Map<String, dynamic> json) =>
    NotificationPreferences(
      isOn: json['isOn'] as bool,
      frequency: (json['frequency'] as num).toInt(),
      timezone: json['timezone'] as String,
      sendTime: json['sendTime'] as String?,
    );

Map<String, dynamic> _$NotificationPreferencesToJson(
        NotificationPreferences instance) =>
    <String, dynamic>{
      'isOn': instance.isOn,
      'frequency': instance.frequency,
      'timezone': instance.timezone,
      'sendTime': instance.sendTime,
    };
