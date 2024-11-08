import 'package:app_logger/app_logger.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../content/content.dart';
import 'preferences_model.dart';

part 'user.model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(
    name: '_id',
    includeToJson: false,
  )
  final String? id;
  final String? name;
  final String? surName;
  @JsonKey(includeToJson: false)
  final String? email;

  final Content? gender;
  final DateTime? birthday;
  final String? profilePicture;

  final PreferencesModel preferences;
  @JsonKey(includeToJson: false)
  final int? familyMemberCount;

  User({
    this.surName,
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.birthday,
    required this.profilePicture,
    required this.preferences,
    this.familyMemberCount,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return _$UserFromJson(json);
    } catch (e) {
      logger.e('Error parsing user: $e');
      rethrow;
    }
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? name,
    String? surName,
    String? email,
    Content? gender,
    DateTime? birthday,
    String? profilePicture,
    PreferencesModel? preferences,
    String? locale,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surName: surName ?? this.surName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      profilePicture: profilePicture ?? this.profilePicture,
      preferences: preferences ?? this.preferences,
    );
  }
}
