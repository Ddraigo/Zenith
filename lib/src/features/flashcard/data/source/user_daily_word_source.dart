import 'package:app_demo/src/features/flashcard/data/dto/daily_word_summary_dto.dart';
import 'package:app_demo/src/features/flashcard/data/dto/user_daily_word_dto.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userDailyWordSourceProvider = Provider<UserDailyWordSource>(
  (ref) => UserDailyWordSource(ref.read(supabaseClientProvider)),
);

class UserDailyWordSource {
  final SupabaseClient _client;
  UserDailyWordSource(this._client);

  Future<Either<AppException, List<UserDailyWordDTO>>> fetchDailyWords({
    required String userId,
    required int topicId,
    DateTime? assignedDate,
  }) async {
    try {
      var query = _client
          .from('user_daily_word')
          .select()
          .eq('user_id', userId);

      if (topicId != 0) {
        query = query.eq('topic_id', topicId);
      }

      if (assignedDate != null) {
        query = query.eq('assigned_date', Format.formatDate(assignedDate.toUtc()));
      }

      final data =
          await query.order('assigned_date', ascending: false) as List<dynamic>;

      return Either.right(
        data
            .map((e) => UserDailyWordDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, List<DailyWordSummaryDTO>>>
  fetchDailyTopicSummary({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final data =
          await _client
                  .from('daily_topic_summary')
                  .select()
                  .eq('user_id', userId)
                  .gte('assigned_date', startDate.toUtc())
                  .lte('assigned_date', endDate.toUtc())
                  .order('assigned_date', ascending: false)
                  .order('topic_id', ascending: true)
              as List<dynamic>;

      return Either.right(
        data
            .map((e) => DailyWordSummaryDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, bool>> updateIsCompleted({
    required String userId,
    required List<String> flashcardIds,
    required DateTime assignedDate,
  }) async {
    try {
      if(flashcardIds.isEmpty){
        return Either.right(false);
      }
      await _client
          .from('user_daily_word')
          .update({'is_completed': true})
          .eq('user_id', userId)
          .eq('assigned_date', Format.formatDate(assignedDate.toUtc()))
          .inFilter('flashcard_id', flashcardIds);

      return const Either.right(true);
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
}
