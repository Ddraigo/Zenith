// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_support_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AISupportDTO _$AISupportDTOFromJson(Map<String, dynamic> json) =>
    _AISupportDTO(
      flashcardId: json['flashcard_id'] as String,
      responseJson: json['response_json'] as Map<String, dynamic>,
      promptVersion: (json['prompt_version'] as num).toInt(),
      modelName: json['model_name'] as String,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AISupportDTOToJson(_AISupportDTO instance) =>
    <String, dynamic>{
      'flashcard_id': instance.flashcardId,
      'response_json': instance.responseJson,
      'prompt_version': instance.promptVersion,
      'model_name': instance.modelName,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
