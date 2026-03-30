// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlashcardDTO _$FlashcardDTOFromJson(Map<String, dynamic> json) =>
    _FlashcardDTO(
      id: json['id'] as String,
      deckId: json['deck_id'] as String,
      position: (json['position'] as num).toInt(),
      word: json['word'] as String,
      partOfSpeech: json['part_of_speech'] as String?,
      phonetic: json['phonetic'] as String?,
      imageUrl: json['image_url'] as String?,
      meaning: json['meaning'] as String,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      audioUrl: json['audio_url'] as String?,
      createdAt: DateTime.parse(json['create_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FlashcardDTOToJson(_FlashcardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deck_id': instance.deckId,
      'position': instance.position,
      'word': instance.word,
      'part_of_speech': instance.partOfSpeech,
      'phonetic': instance.phonetic,
      'image_url': instance.imageUrl,
      'meaning': instance.meaning,
      'example': instance.example,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'audio_url': instance.audioUrl,
      'create_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
