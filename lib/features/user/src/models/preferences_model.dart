import 'package:json_annotation/json_annotation.dart';

import '../../user.dart';

part 'preferences_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PreferencesModel {
  final NotificationPreferences notifications;
  final String locale;

  PreferencesModel({required this.notifications, required this.locale});

  factory PreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$PreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesModelToJson(this);

  PreferencesModel copyWith({
    NotificationPreferences? notifications,
    String? locale,
  }) {
    return PreferencesModel(
      notifications: notifications ?? this.notifications,
      locale: locale ?? this.locale,
    );
  }
}
