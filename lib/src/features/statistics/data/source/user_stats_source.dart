import 'dart:developer' as developer;

import 'package:app_demo/src/features/statistics/data/dto/user_stats_dto.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userStatsSourceProvider = Provider<UserStatsSource>(
  (ref) => UserStatsSource(ref.read(supabaseClientProvider)),
);

class UserStatsSource {
  final SupabaseClient _client;
  UserStatsSource(this._client);

  Map<String, dynamic> _buildPayload(UserStatsDTO userStats){
    final payload = userStats.toJson();
    payload.removeWhere((_,value) => value == null);
    return payload;
  }

  Future<Either<AppException, UserStatsDTO>> updatedUserStats({
    required UserStatsDTO userStats,
  }) async {
    try {
      if (userStats.userId.isEmpty) {
        return Either.left(
          AppException.badRequest('Không tìm thấy user'),
        );
      }

      final data =
          await _client
                  .from('user_stats')
                  .upsert(_buildPayload(userStats), onConflict: 'user_id')
                  .select()
                  .single();

      return Either.right(UserStatsDTO.fromJson(data));
    } catch (e, st) {
      developer.log('updatedUserStats error: $e');
      developer.log('$st');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, UserStatsDTO>> fetchUserStats({
    required String userId,
  }) async {
    try {
      final data = await _client
          .from('user_stats')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (data == null) {
        return Either.right(
          UserStatsDTO(
            userId: userId,
            streakCount: 0,
            totalPoints: 0,
          ),
        );
      }
      return Either.right(UserStatsDTO.fromJson(data));
    } catch (e, st) {
      developer.log('fetchUserStats error: $e');
      developer.log('$st');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  

}
