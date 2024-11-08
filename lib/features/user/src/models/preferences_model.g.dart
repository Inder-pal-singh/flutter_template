// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferencesModel _$PreferencesModelFromJson(Map<String, dynamic> json) =>
    PreferencesModel(
      notifications: NotificationPreferences.fromJson(
          json['notifications'] as Map<String, dynamic>),
      locale: json['locale'] as String,
    );

Map<String, dynamic> _$PreferencesModelToJson(PreferencesModel instance) =>
    <String, dynamic>{
      'notifications': instance.notifications.toJson(),
      'locale': instance.locale,
    };
