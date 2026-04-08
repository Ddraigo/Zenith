import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_dto.freezed.dart';
part 'flashcard_dto.g.dart';

@freezed
abstract class FlashcardDTO with _$FlashcardDTO{

  const factory FlashcardDTO({
    required String id,

    @JsonKey(name:'topic_id') 
    required int topicId,

    required String word,

    @JsonKey(name:'part_of_speech') 
    String? partOfSpeech,

    required String meaning,
    String? example,

    @JsonKey(name:'created_at') 
    required DateTime createdAt,

  }) = _FlashcardDTO;

  factory FlashcardDTO.fromJson(Map<String, dynamic> json) => _$FlashcardDTOFromJson(json);
}

extension FlashcardDTOMapper on FlashcardDTO {
  FlashcardModel toDomain() {
    return FlashcardModel(
      id: id,
      topicId: topicId,
      word: word,
      partOfSpeech: partOfSpeech,
      meaning: meaning,
      example: example,
      createdAt: createdAt,
    );
  }
}
