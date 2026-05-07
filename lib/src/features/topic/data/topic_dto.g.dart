// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicDTO _$TopicDTOFromJson(Map<String, dynamic> json) => _TopicDTO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  icon: json['svg_content'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TopicDTOToJson(_TopicDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'svg_content': instance.icon,
  'created_at': instance.createdAt?.toIso8601String(),
};
