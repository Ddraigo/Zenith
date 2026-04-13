import 'dart:developer' as developer;
import 'package:app_demo/src/features/flashcard/data/dto/daily_word_summary_dto.dart';
import 'package:app_demo/src/features/flashcard/data/dto/user_daily_word_dto.dart';
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
    String? assignedDate,
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
        query = query.eq('assigned_date', assignedDate);
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
    required String startDate,
    required String endDate,
  }) async {
    try {
      final data =
          await _client
                  .from('daily_topic_summary')
                  .select()
                  .eq('user_id', userId)
                    .gte('assigned_date', startDate)
                    .lte('assigned_date', endDate)
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
    required String assignedDate,
  }) async {
    try {
      if (flashcardIds.isEmpty) {
        return Either.right(false);
      }
      
      developer.log('[updateIsCompleted] userId: $userId');
      developer.log('[updateIsCompleted] assignedDate: $assignedDate');
      developer.log('[updateIsCompleted] flashcardIds: $flashcardIds (count: ${flashcardIds.length})');
      
      final updatedRows = await _client
          .from('user_daily_word')
          .update({'is_completed': true})
          .eq('user_id', userId)
          .eq('assigned_date', assignedDate)
          .inFilter('flashcard_id', flashcardIds)
          .select('flashcard_id') as List<dynamic>;

      developer.log('[updateIsCompleted] updatedRows: ${updatedRows.length}');
      
      return Either.right(updatedRows.isNotEmpty);
    } catch (e) {
      developer.log('[updateIsCompleted] ERROR: $e');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
}
