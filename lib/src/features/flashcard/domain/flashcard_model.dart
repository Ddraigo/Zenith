import 'package:freezed_annotation/freezed_annotation.dart';
part 'flashcard_model.freezed.dart';
@freezed
abstract class FlashcardModel with _$FlashcardModel{
  
  const factory FlashcardModel({
    String? id,
    required String deckId,
    required int position,
    required String word,
    String? partOfSpeech,
    String? phonetic,
    String? imageUrl,
    required String meaning,
    String? example,
    List<String>? synonyms,
    List<String>? antonyms,
    String? audioUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FlashcardModel;
  
}

// extension FlashcardValidate on FlashcardModel{

// }


