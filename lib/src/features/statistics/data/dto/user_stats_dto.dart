import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_stats_dto.freezed.dart';
part 'user_stats_dto.g.dart';

@freezed
abstract class UserStatsDTO with _$UserStatsDTO{
  const factory UserStatsDTO({
    required String userId,

    @JsonKey(name:'streak_count')
    int? streakCount,

    @JsonKey(name: 'last_learned_date')
    DateTime? lastLearnedDate,

    @JsonKey(name: 'total_points')
    int? totaPoints,

    @JsonKey(name: 'updated_at')
    DateTime? updatedAt,

  }) = _UserStatsDTO;

  factory UserStatsDTO.fromJson(Map<String,dynamic> json) => _$UserStatsDTOFromJson(json);
}

extension UserStatsDTOMapper on UserStatsDTO{
  UserStatsModel toDomain(){
    return UserStatsModel(
      userId: userId, 
      streakCount: streakCount,
      lastLearnedDate: lastLearnedDate,
      totaPoints: totaPoints,
      updatedAt: updatedAt,
    );
  }
}