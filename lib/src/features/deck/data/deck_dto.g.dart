// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeckDTO _$DeckDTOFromJson(Map<String, dynamic> json) => _DeckDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  learningTypeId: json['learning_type_id'] as String?,
  topicId: json['topic_id'] as String?,
  level: json['level'] as String?,
  description: json['description'] as String?,
  imageUrl: json['cover_image_url'] as String?,
  createdBy: json['created_by'] as String,
  isSystem: json['is_system'] as bool,
  isPublic: json['is_public'] as bool,
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DeckDTOToJson(_DeckDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'learning_type_id': instance.learningTypeId,
  'topic_id': instance.topicId,
  'level': instance.level,
  'description': instance.description,
  'cover_image_url': instance.imageUrl,
  'created_by': instance.createdBy,
  'is_system': instance.isSystem,
  'is_public': instance.isPublic,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
