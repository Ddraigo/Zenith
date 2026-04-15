
import 'package:app_demo/src/features/statistics/data/dto/user_stats_dto.dart';
import 'package:app_demo/src/features/statistics/data/source/user_stats_source.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/format.dart';
import '../../domain/user_stats_model.dart';

final userStatsRepoProvider = Provider<UserStatsRepo>(
  (ref) => UserStatsRepo(ref.read(userStatsSourceProvider)));

class UserStatsRepo {
  final UserStatsSource _source;
  UserStatsRepo(this._source);

  Future<Either<AppException, UserStatsModel>> updatedUserStats({
    required UserStatsModel userStats,
  })async{
    
    final result = await _source.updatedUserStats(
      userStats: UserStatsDTO(
        userId: userStats.userId, 
        streakCount: userStats.streakCount, 
        lastLearnedDate:userStats.lastLearnedDate == null ? null : Format.normalizeDate(userStats.lastLearnedDate), 
        totalPoints: userStats.totalPoints,
        lastPointsAwardedDate: userStats.lastPointsAwardedDate == null ? null : Format.normalizeDate(userStats.lastPointsAwardedDate),
        lastStreakCountedDate: userStats.lastStreakCountedDate == null ? null : Format.normalizeDate(userStats.lastStreakCountedDate),
      ));
    return result.fold(
      ifLeft: (e) => e.left(), 
      ifRight: (dto) => dto.toDomain().right(),
    );
  }

  Future<Either<AppException, UserStatsModel>> fetchUserStats({
    required String userId,
  })async{
    final result = await _source.fetchUserStats(userId: userId);
      
    return result.fold(
      ifLeft: (e) => e.left(), 
      ifRight: (dto) => dto.toDomain().right(),
    );
  }

  
}