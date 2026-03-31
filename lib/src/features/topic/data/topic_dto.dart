

import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic_dto.g.dart';
part 'topic_dto.freezed.dart';

@freezed
abstract class TopicDTO with _$TopicDTO{
  const factory TopicDTO({
    required int id,
    required String name,

    @JsonKey(name: 'created_at')
    DateTime? createdAt,

  }) = _TopicDTO;

  factory TopicDTO.fromJson(Map<String, dynamic> json) => _$TopicDTOFromJson(json);
}

extension TopicDTOMapper on TopicDTO{
  TopicModel toDomain(){
    return TopicModel(
      id: id, 
      name: name,
      createdAt: createdAt,
    );
  }
} 