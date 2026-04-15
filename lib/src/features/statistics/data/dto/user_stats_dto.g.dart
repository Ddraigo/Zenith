// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsDTO _$UserStatsDTOFromJson(Map<String, dynamic> json) =>
    _UserStatsDTO(
      userId: json['user_id'] as String,
      streakCount: (json['streak_count'] as num).toInt(),
      lastLearnedDate: json['last_learned_date'] == null
          ? null
          : DateTime.parse(json['last_learned_date'] as String),
      totalPoints: (json['total_points'] as num).toInt(),
      lastPointsAwardedDate: json['last_points_awarded_date'] == null
          ? null
          : DateTime.parse(json['last_points_awarded_date'] as String),
      lastStreakCountedDate: json['last_streak_counted_date'] == null
          ? null
          : DateTime.parse(json['last_streak_counted_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserStatsDTOToJson(
  _UserStatsDTO instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'streak_count': instance.streakCount,
  'last_learned_date': instance.lastLearnedDate?.toIso8601String(),
  'total_points': instance.totalPoints,
  'last_points_awarded_date': instance.lastPointsAwardedDate?.toIso8601String(),
  'last_streak_counted_date': instance.lastStreakCountedDate?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
};
