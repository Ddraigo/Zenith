import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_stats_model.freezed.dart';

@freezed
abstract class UserStatsModel with _$UserStatsModel{
  const factory UserStatsModel({

    required String userId,

    required int streakCount,
    
    required int totalPoints,

    int? pointAdded,

    DateTime? lastPointsAwardedDate,
    DateTime? lastStreakCountedDate,
    DateTime? lastLearnedDate,

  }) = _UserStatsModel;

}
