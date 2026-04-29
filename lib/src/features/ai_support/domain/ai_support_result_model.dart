import 'package:freezed_annotation/freezed_annotation.dart';
import 'flashcard_ai_support_model.dart';

part 'ai_support_result_model.freezed.dart';

enum TypeSource{cached, pending, quotaExceeded, unknown, timeout}

@freezed
abstract class AISupportResultModel with _$AISupportResultModel {
  const factory AISupportResultModel({
    required bool cached,
    required TypeSource source,
    required FlashcardAiSupportModel data,
    @Default('') 
    String phonetic,
    @Default('') 
    String audioUs,
  }) = _AISupportResultModel;
}
