// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String?,
      content: json['content'] as String,
      value: json['value'] as String,
      index: (json['index'] as num?)?.toInt(),
      relationType: (json['relationType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'value': instance.value,
      'index': instance.index,
      'relationType': instance.relationType,
    };
