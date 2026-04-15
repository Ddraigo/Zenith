import 'dart:developer' as developer;

import 'package:app_demo/src/features/flashcard/data/repository/user_daily_word_repository.dart';
import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userDailyWordServiceProvider = Provider(UserDailyWordService.new);

class UserDailyWordService {
  final Ref _ref;
  UserDailyWordService(this._ref);
  late final _client = _ref.read(supabaseClientProvider);
  late final _repo = _ref.read(userDailyWordRepoProvider);

  Either<AppException, String> _currentUserIdEither() {
    final user = _client.auth.currentUser;
    if (user == null) {
      return const AppException.unauthorized().left();
    }
    return user.id.right();
  }

  Future<Either<AppException, List<UserDailyWordModel>>> getDailyWords({
    int? topicId,
    DateTime? assignedDate,
  }) async {
    final userIdResult = _currentUserIdEither();
    return userIdResult.fold(
      ifLeft: (e) => e.left(),
      ifRight: (userId) => _repo.fetchDailyWords(
        userId: userId,
        topicId: topicId ?? 0,
        assignedDate: assignedDate,
      ),
    );
  }

  Future<Map<DateTime, List<DailyWordSummaryModel>>> getDailyTopicsGrouped({
    DateTime? startDate,
    DateTime? endDate,
    int? dayRange
  }) async {

    final now = DateTime.now();
    final end = endDate ?? now;
    final start = startDate ?? now.subtract(Duration(days: dayRange ?? 7));

    final userIdResult = _currentUserIdEither();
    final userId = userIdResult.fold(
      ifLeft: (e) => throw e,
      ifRight: (id) => id,
    );

    final result = await _repo.fetchDailyTopicSummary(
      userId: userId, 
      startDate: start,
      endDate: end,
    );

    return result.fold(
      ifLeft: (error){
        developer.log('UserDailyWordService: error getDailyTopicsGrouped', error: error);
        throw error;
      }, 
      ifRight: (datas) {
        final groupedData = <DateTime, List<DailyWordSummaryModel>>{};

        for (final data in datas) {
          final date = DateTime(
            data.assignedDate.year,
            data.assignedDate.month,
            data.assignedDate.day,
          );

          groupedData.putIfAbsent(date, () => []);
          groupedData[date]!.add(data);
        }
        return groupedData;
      },
    );
  }

  Future<Either<AppException, bool>> updateIsCompleted({
    required List<String> flashcardIds,
    required DateTime assignedDate,
  }) async {
    if (flashcardIds.isEmpty) {
      return const AppException.badRequest(
        'updateIsCompleted: flashcardIds is empty',
      ).left();
    }
    final userIdResult = _currentUserIdEither();
    return userIdResult.fold(
      ifLeft: (e) => e.left(),
      ifRight: (userId) async {
        final result = await _repo.updateIsCompleted(
          userId: userId,
          flashcardIds: flashcardIds,
          assignedDate: assignedDate,
        );
        return result.fold(
          ifLeft: (error) {
            developer.log(
              'UserDailyWordService: error updateIsCompleted',
              error: error,
            );
            return error.left();
          },
          ifRight: (updated) => updated.right(),
        );
      },
    );
  }
}
