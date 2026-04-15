import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_stats_dto.freezed.dart';
part 'user_stats_dto.g.dart';

@freezed
abstract class UserStatsDTO with _$UserStatsDTO{
  const factory UserStatsDTO({
    
    @JsonKey(name:'user_id')
    required String userId,

    @JsonKey(name:'streak_count')
    required int streakCount,

    @JsonKey(name: 'last_learned_date')
    DateTime? lastLearnedDate,

    @JsonKey(name: 'total_points')
    required int totalPoints,

    @JsonKey(name: 'last_points_awarded_date')
    DateTime? lastPointsAwardedDate,

    @JsonKey(name: 'last_streak_counted_date')
    DateTime? lastStreakCountedDate,

    @JsonKey(name: 'created_at')
    DateTime? createdAt,

  }) = _UserStatsDTO;

  factory UserStatsDTO.fromJson(Map<String,dynamic> json) => _$UserStatsDTOFromJson(json);
}

extension UserStatsDTOMapper on UserStatsDTO{
  UserStatsModel toDomain(){
    return UserStatsModel(
      userId: userId, 
      streakCount: streakCount,
      lastLearnedDate: lastLearnedDate,
      totalPoints: totalPoints,
      lastPointsAwardedDate: lastPointsAwardedDate,
      lastStreakCountedDate: lastStreakCountedDate,
    );
  }
}