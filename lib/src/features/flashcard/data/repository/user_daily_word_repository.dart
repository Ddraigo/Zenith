import 'package:app_demo/src/features/flashcard/data/dto/daily_word_summary_dto.dart';
import 'package:app_demo/src/features/flashcard/data/dto/user_daily_word_dto.dart';
import 'package:app_demo/src/features/flashcard/data/source/user_daily_word_source.dart';
import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDailyWordRepoProvider = Provider<UserDailyWordRepository>(
  (ref) => UserDailyWordRepository(ref.read(userDailyWordSourceProvider)),
);

class UserDailyWordRepository {
  final UserDailyWordSource _source;
  UserDailyWordRepository(this._source);

  Future<Either<AppException, List<UserDailyWordModel>>> fetchDailyWords({
    required String userId,
    required int topicId,
    DateTime? assignedDate,
  }) async {
    final assignedDateString = assignedDate == null
        ? null
        : Format.formatDate(assignedDate);
    final result = await _source.fetchDailyWords(
      userId: userId,
      topicId: topicId,
      assignedDate: assignedDateString,
    );
    return result.map((dailyword) {
      return dailyword.map((dto) => dto.toDomain()).toList();
    });
  }

  Future<Either<AppException, List<DailyWordSummaryModel>>>
  fetchDailyTopicSummary({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final startDateString = Format.formatDate(startDate);
    final endDateString = Format.formatDate(endDate);
    final result = await _source.fetchDailyTopicSummary(
      userId: userId, 
      startDate: startDateString, 
      endDate: endDateString,
    );
    return result.map((dailyword) {
      return dailyword.map((dto) => dto.toDomain()).toList();
    });
  }


  Future<Either<AppException, bool>> updateIsCompleted({
    required String userId,
    required List<String> flashcardIds,
    required DateTime assignedDate,
  }) async {
    final assignedDateString = Format.formatDate(assignedDate);
    final result = await _source.updateIsCompleted(
      userId: userId, 
      flashcardIds: flashcardIds, 
      assignedDate: assignedDateString,
    );

    return result;
  }
}
