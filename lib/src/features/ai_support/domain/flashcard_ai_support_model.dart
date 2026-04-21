
import 'package:freezed_annotation/freezed_annotation.dart';
part 'flashcard_ai_support_model.freezed.dart';
@freezed
abstract class FlashcardAiSupportModel with _$FlashcardAiSupportModel{
  const factory FlashcardAiSupportModel({
        required String easyMeaning,
        required List<String> whenToUse,
        required List<ExampleItemModel> examples,
        required List<String> commonPhrases,
        required List<String> synonyms,
        @Default([])
        List<String>? antonyms,
        @Default('')
        String? memoryTip,
  }) = _FlashcardAiSupportModel;
}

@freezed
abstract class ExampleItemModel with _$ExampleItemModel{
  const factory ExampleItemModel({
    @Default('')
    String? en,
    @Default('')
    String? vi,
  }) = _ExampleItemModel;
}