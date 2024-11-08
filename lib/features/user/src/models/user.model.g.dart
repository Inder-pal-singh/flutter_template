// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      surName: json['surName'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] == null
          ? null
          : Content.fromJson(json['gender'] as Map<String, dynamic>),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      profilePicture: json['profilePicture'] as String?,
      preferences: PreferencesModel.fromJson(
          json['preferences'] as Map<String, dynamic>),
      familyMemberCount: (json['familyMemberCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surName': instance.surName,
      'gender': instance.gender?.toJson(),
      'birthday': instance.birthday?.toIso8601String(),
      'profilePicture': instance.profilePicture,
      'preferences': instance.preferences.toJson(),
    };
