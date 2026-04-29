import 'dart:developer' as developer;

import 'package:app_demo/src/features/flashcard/application/user_daily_word_service.dart';
import 'package:app_demo/src/features/profile/application/profile_service.dart';
import 'package:app_demo/src/features/statistics/data/repository/user_stats_repo.dart';
import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/provider/current_user_id_notifire.dart';
import '../../../core/provider/reward_summary_provider.dart';

final userStatsServiceProvider = Provider(StatisticsService.new);

class StatisticsService {
  final Ref _ref;
  StatisticsService(this._ref);
  late final _repo = _ref.read(userStatsRepoProvider);
  late final _userDailyWordRepo = _ref.read(userDailyWordServiceProvider); 
  String get _currentUserId => _ref.read(currentUserIdProvider);



  Future<Either<AppException, UserStatsModel>> handleDailyReward({
    required DateTime assignedDate,
    required int topicId,
  }) async {
    if (_currentUserId.isEmpty) {
      return AppException.badRequest('Thiếu thông tin người dùng.').left();
    }

    final hasProfile =
        await _ref.read(profileServiceProvider).hasProfile(_currentUserId);
    if (!hasProfile) {
      return AppException.badRequest('Hồ sơ cá nhân chưa được tạo.').left();
    }
    final userStatsResult = await _repo.fetchUserStats(userId: _currentUserId);

    return userStatsResult.fold(
      ifLeft: (e) {
        developer.log('handleDailyReward: fetchUserStats failed', error: e);
        return e.left();
      },
      ifRight: (userStats) async {
        final dailyWordsResult = await _userDailyWordRepo.getDailyWords(
          topicId: topicId,
          assignedDate: assignedDate,
        );

        return dailyWordsResult.fold(
          ifLeft: (e) {
            developer.log('handleDailyReward: getDailyWords failed', error: e);
            return e.left();
          },
          ifRight: (dailyWords) async {
            if (dailyWords.isEmpty) {
              // developer.log(
              //   'handleDailyReward: no daily words, skip reward '
              //   '(userId=$userId, topicId=$topicId, assignedDate=${assignedDate.toIso8601String()})',
              // );
              return userStats.right();
            }

            final today = Format.normalizeDate(DateTime.now());
             // Only award if the quiz is from today
            if (!MyHelper.sameDate(assignedDate, today)) {
              return userStats.right();
            }
            
            final yesterday = today.subtract(const Duration(days: 1));

            final completeCount = dailyWords
                .where((e) => e.isCompleted == true)
                .length;
            final total = dailyWords.length;
            final reached50 = completeCount * 2 >= total;
            final reached100 = completeCount == total;

            // developer.log(
            //   'handleDailyReward: progress summary '
            //   '(userId=$userId, topicId=$topicId, assignedDate=${assignedDate.toIso8601String()}, '
            //   'completeCount=$completeCount, total=$total, reached50=$reached50, reached100=$reached100)',
            // );

            if (!reached50) {
              // developer.log('handleDailyReward: skip because reached50=false');
              return userStats.right();
            }

            final pointsAwardedToday = MyHelper.sameDate(
              userStats.lastPointsAwardedDate,
              today,
            );
            final streakCountedToday =  MyHelper.sameDate(
              userStats.lastStreakCountedDate,
              today,
            );

            // developer.log(
            //   'handleDailyReward: daily guards '
            //   '(pointsAwardedToday=$pointsAwardedToday, streakCountedToday=$streakCountedToday, '
            //   'lastLearnedDate=${userStats.lastLearnedDate?.toIso8601String()}, '
            //   'lastPointsAwardedDate=${userStats.lastPointsAwardedDate?.toIso8601String()}, '
            //   'lastStreakCountedDate=${userStats.lastStreakCountedDate?.toIso8601String()})',
            // );

            int totalPoints = userStats.totalPoints;
            int streakCount = userStats.streakCount;
            int pointAdded = 0;
            bool streakReset = false;

            DateTime? lastLearnedDate = userStats.lastLearnedDate;
            DateTime? lastPointsAwardedDate = userStats.lastPointsAwardedDate;
            DateTime? lastStreakCountedDate = userStats.lastStreakCountedDate;

            if (!pointsAwardedToday) {
              pointAdded += 5;
              totalPoints += 5;
              if (reached100) {
                pointAdded += 5;
                totalPoints += 5;
              }
              lastPointsAwardedDate = today;
            }

            if (!streakCountedToday) {
              final isContinue =
                  lastLearnedDate != null &&  MyHelper.sameDate(lastLearnedDate, yesterday);

              streakCount = isContinue ? streakCount + 1 : 1;
              if (!isContinue) {
                streakReset = true;
              }
              lastLearnedDate = today;
              lastStreakCountedDate = today;

              if (streakCount % 30 == 0) {
                totalPoints += 25;
                pointAdded += 25;
              } else if (streakCount % 14 == 0) {
                totalPoints += 15;
                pointAdded += 15;
              } else if (streakCount % 7 == 0) {
                totalPoints += 10;
                pointAdded += 10;
              }
            }

            final hasChanges =
                pointAdded > 0 ||
                streakCount != userStats.streakCount ||
                ! MyHelper.sameDate(lastLearnedDate, userStats.lastLearnedDate) ||
                ! MyHelper.sameDate(lastPointsAwardedDate, userStats.lastPointsAwardedDate) ||
                ! MyHelper.sameDate(lastStreakCountedDate, userStats.lastStreakCountedDate);

            // developer.log(
            //   'handleDailyReward: computed update '
            //   '(pointAdded=$pointAdded, totalPoints=$totalPoints, streakCount=$streakCount, hasChanges=$hasChanges)',
            // );

            if (!hasChanges) {
              // developer.log('handleDailyReward: skip because hasChanges=false');
              return userStats.right();
            }

            final streakAdded =
                streakCount > userStats.streakCount
                    ? streakCount - userStats.streakCount
                    : 0;
            final rewardSummary = RewardSummary(
              pointAdded: pointAdded,
              streakAdded: streakAdded,
              streakCount: streakCount,
              streakReset: streakReset,
            );

            final updateResult = await _repo.updatedUserStats(
              userStats: UserStatsModel(
                userId: _currentUserId,
                streakCount: streakCount,
                totalPoints: totalPoints,
                pointAdded: pointAdded,
                lastLearnedDate: lastLearnedDate,
                lastPointsAwardedDate: lastPointsAwardedDate,
                lastStreakCountedDate: lastStreakCountedDate,
              ),
            );

            return updateResult.fold(
              ifLeft: (e) => e.left(),
              ifRight: (updatedStats) {
                // developer.log(
                //   'handleDailyReward: setting reward '
                //   '(pointAdded=${rewardSummary.pointAdded}, '
                //   'streakAdded=${rewardSummary.streakAdded}, '
                //   'streakReset=${rewardSummary.streakReset}, '
                //   'hasReward=${rewardSummary.hasReward})',
                // );
                if (rewardSummary.hasReward) {
                  _ref.read(rewardSummaryProvider.notifier).state =
                      rewardSummary;
                  // developer.log('handleDailyReward: reward set successfully');
                } else {
                  // developer.log('handleDailyReward: no reward to set');
                }
                return updatedStats.right();
              },
            );
          },
        );
      },
    );
  }

  Future<int> getStreakDay()async{
    final result = await _repo.fetchUserStats(userId: _currentUserId);
    return result.fold(
      ifLeft: (e) => throw e, 
      ifRight: (stats) {
        final now = DateTime.now();
        final today = Format.normalizeDate(now);
        final yesterday = today.subtract(const Duration(days: 1));

        if(stats.lastLearnedDate == null) return 0;
        if(MyHelper.sameDate(stats.lastLearnedDate, today) || MyHelper.sameDate(stats.lastLearnedDate, yesterday)){
          return stats.streakCount;
        }
        return 0;
      },
    );
  }

}
