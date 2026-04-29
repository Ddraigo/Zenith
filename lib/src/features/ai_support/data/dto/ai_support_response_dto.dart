import 'dart:developer' as developer;

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

      final parsedSource = _parseSource(source);
      final easyMeaning = Format.asString(dataMap['easy_meaning']);
      final whenToUse = Format.asStringList(dataMap['when_to_use']);
      final examples = _asExamples(dataMap['examples']);
      final commonPhrases = Format.asStringList(dataMap['common_phrases']);
      final synonyms = Format.asStringList(dataMap['synonyms']);
      final antonyms = Format.asStringList(dataMap['antonyms']);
      final memoryTip = Format.asString(dataMap['memory_tip']);


        return AISupportResultModel(
          cached: cached, 
          source: parsedSource, 
          data: FlashcardAiSupportModel(
            easyMeaning: easyMeaning,
            whenToUse: whenToUse,
            examples: examples,
            commonPhrases: commonPhrases,
            synonyms: synonyms,
            antonyms: antonyms,
            memoryTip: memoryTip,
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

TypeSource _parseSource(String sourceString){
  try {
    return TypeSource.values.firstWhere(
      (e) => e.name == sourceString.toLowerCase().replaceAll('_', ''),
      orElse: () => TypeSource.unknown,
    );
  } catch (e) {
    developer.log(
      'DTO: ',
      error: e,
    );
    return TypeSource.unknown;
  }
}