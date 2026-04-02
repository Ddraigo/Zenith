// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsDTO _$UserStatsDTOFromJson(Map<String, dynamic> json) =>
    _UserStatsDTO(
      userId: json['userId'] as String,
      streakCount: (json['streak_count'] as num?)?.toInt(),
      lastLearnedDate: json['last_learned_date'] == null
          ? null
          : DateTime.parse(json['last_learned_date'] as String),
      totaPoints: (json['total_points'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserStatsDTOToJson(_UserStatsDTO instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'streak_count': instance.streakCount,
      'last_learned_date': instance.lastLearnedDate?.toIso8601String(),
      'total_points': instance.totaPoints,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
