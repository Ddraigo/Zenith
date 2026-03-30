
import 'package:app_demo/src/features/deck/domain/deck_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_dto.freezed.dart';
part 'deck_dto.g.dart';

@freezed
abstract class DeckDTO with _$DeckDTO{

  const factory DeckDTO({
    required String id,
    required String name,

    @JsonKey(name: 'learning_type_id')
    String? learningTypeId,

    @JsonKey(name: 'topic_id')
    String? topicId,

    String? level,
    String? description,

    @JsonKey(name: 'cover_image_url')
    String? imageUrl,

    @JsonKey(name: 'created_by')
    required String createdBy,

    @JsonKey(name: 'is_system')
    required bool isSystem,

    @JsonKey(name: 'is_public')
    required bool isPublic,

    @JsonKey(name: 'is_active')
    required bool isActive,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
  }) = _DeckDTO;

  factory DeckDTO.fromJson(Map<String, dynamic> json) => _$DeckDTOFromJson(json);
}

extension DeckDTOMapper on DeckDTO{
  DeckModel toDomain(){
    return DeckModel(
      id: id,
      learningTypeId: learningTypeId,
      topicId: topicId,
      level: level,
      description: description,
      name: name, 
      imageUrl: imageUrl,
      createdBy: createdBy,
      isSystem: isSystem, 
      isPublic: isPublic, 
      isActive: isActive, 
      createdAt: createdAt, 
      updatedAt: updatedAt,
    );

  }
}
