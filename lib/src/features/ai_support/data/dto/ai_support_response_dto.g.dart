// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_support_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AISupportResponseDTO _$AISupportResponseDTOFromJson(
  Map<String, dynamic> json,
) => _AISupportResponseDTO(
  cached: json['cached'] as bool,
  source: json['source'] as String,
  data: json['data'] as Map<String, dynamic>,
  meta: json['meta'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AISupportResponseDTOToJson(
  _AISupportResponseDTO instance,
) => <String, dynamic>{
  'cached': instance.cached,
  'source': instance.source,
  'data': instance.data,
  'meta': instance.meta,
};
