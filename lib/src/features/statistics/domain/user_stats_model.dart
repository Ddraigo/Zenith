import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_stats_model.freezed.dart';

@freezed
abstract class UserStatsModel with _$UserStatsModel{
  const factory UserStatsModel({

    required String userId,

    @Default(0)
    int? streakCount,

    DateTime? lastLearnedDate,

    @Default(0)
    int? totaPoints,

    DateTime? updatedAt,

  }) = _UserStatsModel;

}