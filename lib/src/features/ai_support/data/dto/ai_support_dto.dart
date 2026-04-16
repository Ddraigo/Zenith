import 'package:app_demo/src/features/ai_support/domain/ai_support_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ai_support_dto.freezed.dart';
part 'ai_support_dto.g.dart';

@freezed
abstract class AISupportDTO with _$AISupportDTO{
    const factory AISupportDTO({
        @JsonKey(name: 'flashcard_id')
        required String flashcardId,
        
        @JsonKey(name: 'response_json')
        required Map<String, dynamic> responseJson,

        @JsonKey(name: 'prompt_version')
        required int promptVersion,

        @JsonKey(name: 'model_name')
        required String modelName,

        @JsonKey(name: 'expires_at')
        DateTime? expiresAt,

        @JsonKey(name: 'created_at')
        required DateTime createdAt,

        @JsonKey(name: 'updated_at')
        required DateTime updatedAt,

    }) = _AISupportDTO;

    factory AISupportDTO.fromJson(Map<String, dynamic> json) => _$AISupportDTOFromJson(json);
}

extension AISupportDTOMapper on AISupportDTO{
    AISupportModel toDomain(){
        return AISupportModel(
            flashcardId: flashcardId, 
            responseJson: responseJson, 
            promptVersion: promptVersion, 
            modelName: modelName
        );
    }
}