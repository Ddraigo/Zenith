import 'dart:developer' as developer;

import 'package:app_demo/src/features/flashcard/application/user_daily_word_service.dart';
import 'package:app_demo/src/features/statistics/data/repository/user_stats_repo.dart';
import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/provider/current_user_id_notifire.dart';

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

            final today = assignedDate;
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
              developer.log('handleDailyReward: skip because reached50=false');
              return userStats.right();
            }

            bool sameDate(DateTime? a, DateTime? b) {
              if (a == null || b == null) return false;
              return a.year == b.year && a.month == b.month && a.day == b.day;
            }

            final pointsAwardedToday = sameDate(
              userStats.lastPointsAwardedDate,
              today,
            );
            final streakCountedToday = sameDate(
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
                  lastLearnedDate != null && sameDate(lastLearnedDate, yesterday);

              streakCount = isContinue ? streakCount + 1 : 1;
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
                !sameDate(lastLearnedDate, userStats.lastLearnedDate) ||
                !sameDate(lastPointsAwardedDate, userStats.lastPointsAwardedDate) ||
                !sameDate(lastStreakCountedDate, userStats.lastStreakCountedDate);

            developer.log(
              'handleDailyReward: computed update '
              '(pointAdded=$pointAdded, totalPoints=$totalPoints, streakCount=$streakCount, hasChanges=$hasChanges)',
            );

            if (!hasChanges) {
              developer.log('handleDailyReward: skip because hasChanges=false');
              return userStats.right();
            }

            return _repo.updatedUserStats(
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
          },
        );
      },
    );
  }

  Future<int> getStreakDay()async{
    final streakDay = await _repo.fetchUserStats(userId: _currentUserId);
    return streakDay.fold(
      ifLeft: (e) => throw e, 
      ifRight: (streak) => streak.streakCount,
    );
  }

}
