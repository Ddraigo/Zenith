
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard_dto.freezed.dart';
part 'flashcard_dto.g.dart';

@freezed
abstract class FlashcardDTO with _$FlashcardDTO{

  const factory FlashcardDTO({
    required String id,

    @JsonKey(name:'deck_id')
    required String deckId,
    required int position,
    required String word,

    @JsonKey(name:'part_of_speech')
    String? partOfSpeech,

    String? phonetic,

    @JsonKey(name:'image_url')
    String? imageUrl,

    required String meaning,
    String? example,
    List<String>? synonyms,
    List<String>? antonyms,

    @JsonKey(name:'audio_url')
    String? audioUrl,

    @JsonKey(name:'create_at')
    required DateTime createdAt,

    @JsonKey(name:'updated_at')
    required DateTime updatedAt,

  }) = _FlashcardDTO;

  factory FlashcardDTO.fromJson(Map<String, dynamic> json) => _$FlashcardDTOFromJson(json);
}

extension FlashcardDtoMapper on FlashcardDTO{
  FlashcardModel toDomain(){
    return FlashcardModel(
      id: id, 
      deckId: deckId, 
      position: position, 
      word: word, 
      partOfSpeech: partOfSpeech,
      phonetic: phonetic,
      imageUrl: imageUrl,
      meaning: meaning, 
      example: example,
      synonyms: synonyms,
      antonyms: antonyms,
      audioUrl: audioUrl,
      createdAt: createdAt, 
      updatedAt: updatedAt
    );
  }
}