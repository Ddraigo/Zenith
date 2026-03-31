import 'package:freezed_annotation/freezed_annotation.dart';
part 'flashcard_model.freezed.dart';
@freezed
abstract class FlashcardModel with _$FlashcardModel{
  
  const factory FlashcardModel({
    @Default('') String? id,
    required int topicId,
    required String word,
    @Default('') String? partOfSpeech,
    required String meaning,
    @Default('') String? example,

    DateTime? createdAt,

  }) = _FlashcardModel;
  
}

// extension FlashcardValidate on FlashcardModel{

// }


