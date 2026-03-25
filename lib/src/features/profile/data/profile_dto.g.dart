// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) => _ProfileDTO(
  userId: json['user_id'] as String,
  userName: json['user_name'] as String,
  avatarUrl: json['avatar_url'] as String?,
  gender: json['gender'] as String,
  dayOfBirth: DateTime.parse(json['day_of_birth'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProfileDTOToJson(_ProfileDTO instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
      'day_of_birth': instance.dayOfBirth.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
