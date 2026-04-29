import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/core/domain/user_flashcard_progress_model.dart';
import 'package:app_demo/src/core/service/user_flashcard_progress_service.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/quiz/application/quiz_attempts_service.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/features/statistics/data/repository/user_stats_repo.dart';
import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'statistics_notifier.g.dart';

class StatisticsViewData {
  final UserStatsModel userStatsModel;
  final List<QuizAttemptsModel> quizAttemptsModel;
  final List<UserFlashcardProgressModel> userFlashcardProgress;

  StatisticsViewData({
    required this.userStatsModel,
    required this.quizAttemptsModel,
    required this.userFlashcardProgress,
  });
}

@riverpod
class StatisticsNotifier extends _$StatisticsNotifier {
  Future<StatisticsViewData> _fetchStatistics(String userId) async {
    if (userId.isEmpty) {
      throw AppException.badRequest('Thiếu thông tin người dùng.');
    }

    final hasProfile = await ref.read(hasProfileProvider.future);
    if (!hasProfile) {
      throw AppException.badRequest('Hồ sơ cá nhân chưa được tạo.');
    }

    final userStatsResult = await ref
        .read(userStatsRepoProvider)
        .fetchUserStats(userId: userId);

    final userStats = userStatsResult.fold(
      ifLeft: (e) => throw e,
      ifRight: (userStats) => userStats,
    );

    final results = await Future.wait([
      ref.read(quizAttemptsServiceProvider).getQuizAttempList(),
      ref
          .read(userFlashcardProgressServiceProvider)
          .fetchFlashcardProgress(),
    ]);

    final quizListResult =
        results[0] as Either<AppException, List<QuizAttemptsModel>>;

    final userProgressResult =
        results[1] as Either<AppException, List<UserFlashcardProgressModel>>;

    final quizList = quizListResult.fold(
      ifLeft: (e) => throw e,
      ifRight: (quizes) => quizes,
    );

    final userProgress = userProgressResult.fold(
      ifLeft: (e) => throw e,
      ifRight: (progress) => progress,
    );

    return StatisticsViewData(
      userStatsModel: userStats,
      quizAttemptsModel: quizList,
      userFlashcardProgress: userProgress,
    );
  }

  @override
  Future<StatisticsViewData> build() async {
    final userId = ref.watch(currentUserIdProvider);
    return _fetchStatistics(userId);
  }

  Future<void> refresh() async {
    final userId = ref.read(currentUserIdProvider);
    // state = const AsyncLoading<StatisticsViewData>();
    state = await AsyncValue.guard(() => _fetchStatistics(userId));
  }
}
