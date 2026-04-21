import 'package:app_demo/src/shared/constants/format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/ai_support_result_model.dart';
import '../../domain/flashcard_ai_support_model.dart';
part 'ai_support_response_dto.freezed.dart';
part 'ai_support_response_dto.g.dart';

@freezed
abstract class AISupportResponseDTO with _$AISupportResponseDTO{
    const factory AISupportResponseDTO({
        @JsonKey(name: 'cached')
        required bool cached,

        @JsonKey(name: 'source')
        required String source,
        
        @JsonKey(name: 'data')
        required Map<String, dynamic> data,

        @JsonKey(name: 'phonetic')
        required String phonetic,

        @JsonKey(name: 'audio')
        required String audio,

        

      }) = _AISupportResponseDTO;

    factory AISupportResponseDTO.fromJson(Map<String, dynamic> json) => _$AISupportResponseDTOFromJson(json);
}

extension AISupportResponseDTOMapper on AISupportResponseDTO{
  AISupportResultModel toDomain(){
      final dataMap = Format.asMap(data);

        return AISupportResultModel(
          cached: cached, 
          source: source, 
          data: FlashcardAiSupportModel(
            easyMeaning:
                Format.asString(dataMap['easy_meaning']),
            whenToUse: Format.asStringList(dataMap['when_to_use']),
            examples: _asExamples(dataMap['examples']),
            commonPhrases: Format.asStringList(dataMap['common_phrases']),
            synonyms: Format.asStringList(dataMap['synonyms']),
            antonyms: Format.asStringList(dataMap['antonyms']),
            memoryTip: Format.asString(dataMap['memory_tip']),
          ),
          phonetic: phonetic,
          audioUs: audio
        );
        
    }
}

List<ExampleItemModel> _asExamples(dynamic value) {
  if (value is! List) return const <ExampleItemModel>[];
  return value.map((item) {
    final map = Format.asMap(item);
    return ExampleItemModel(
      en: Format.asString(map['en']),
      vi: Format.asString(map['vi']),
    );
  }).toList(growable: false);
}