import 'package:freezed_annotation/freezed_annotation.dart';
import 'flashcard_ai_support_model.dart';

part 'ai_support_result_model.freezed.dart';
@freezed
abstract class AISupportResultModel with _$AISupportResultModel{
  const factory AISupportResultModel({
    required bool cached,
    required String source,
    required FlashcardAiSupportModel data,

  }) = _AISupportResultModel;
}