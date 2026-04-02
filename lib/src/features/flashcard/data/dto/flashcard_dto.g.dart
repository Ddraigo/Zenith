// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlashcardDTO _$FlashcardDTOFromJson(Map<String, dynamic> json) =>
    _FlashcardDTO(
      id: json['id'] as String,
      topicId: (json['topic_id'] as num).toInt(),
      word: json['word'] as String,
      partOfSpeech: json['part_of_speech'] as String?,
      meaning: json['meaning'] as String,
      example: json['example'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$FlashcardDTOToJson(_FlashcardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic_id': instance.topicId,
      'word': instance.word,
      'part_of_speech': instance.partOfSpeech,
      'meaning': instance.meaning,
      'example': instance.example,
      'created_at': instance.createdAt.toIso8601String(),
    };
