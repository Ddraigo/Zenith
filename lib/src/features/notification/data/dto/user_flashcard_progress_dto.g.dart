// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_flashcard_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFlashcardProgressDTO _$UserFlashcardProgressDTOFromJson(
  Map<String, dynamic> json,
) => _UserFlashcardProgressDTO(
  userId: json['userId'] as String,
  flashcardId: json['flashcard_id'] as String,
  isLearned: json['is_learned'] as bool?,
  wrongCount: (json['wrong_count'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserFlashcardProgressDTOToJson(
  _UserFlashcardProgressDTO instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'flashcard_id': instance.flashcardId,
  'is_learned': instance.isLearned,
  'wrong_count': instance.wrongCount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
