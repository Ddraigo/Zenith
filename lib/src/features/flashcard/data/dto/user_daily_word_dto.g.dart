// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_daily_word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDailyWordDTO _$UserDailyWordDTOFromJson(Map<String, dynamic> json) =>
    _UserDailyWordDTO(
      userId: json['user_id'] as String,
      flashcardId: json['flashcard_id'] as String,
      topicId: (json['topic_id'] as num?)?.toInt(),
      assignedDate: DateTime.parse(json['assigned_date'] as String),
      isCompleted: json['is_completed'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserDailyWordDTOToJson(_UserDailyWordDTO instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'flashcard_id': instance.flashcardId,
      'topic_id': instance.topicId,
      'assigned_date': instance.assignedDate.toIso8601String(),
      'is_completed': instance.isCompleted,
      'created_at': instance.createdAt?.toIso8601String(),
    };
