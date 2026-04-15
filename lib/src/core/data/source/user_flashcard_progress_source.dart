
import 'dart:developer' as developer;

import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../dto/user_flashcard_progress_dto.dart';

final userFlashcardProgressSourceProvider = Provider(
  (ref) => UserFlashcardProgressSource(ref.read(supabaseClientProvider)),
);

class UserFlashcardProgressSource {
  final SupabaseClient _client;
  UserFlashcardProgressSource(this._client);

  Future<Either<AppException, List<UserFlashcardProgressDTO>>> updateFlashcardProgress({
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      if(items.isEmpty){
        return Either.right([]);
      }
      final userId = items.first['user_id'];
      final flashcardIds = items.map((e) => e['flashcard_id']).toList();
      final fetchData = await _client.from('user_flashcard_progress')
                                    .select('flashcard_id, wrong_count')
                                    .eq('user_id', userId)
                                    .inFilter('flashcard_id', flashcardIds) as List<dynamic>;

      final mapData = <String, int>{
        for(var e in fetchData)
          e['flashcard_id'] as String : (e['wrong_count'] as int?) ?? 0,
      };

      final upsertItems = items.map((item){
          final flashcardId = item['flashcard_id'];
          final wrongDelta = (item['wrong_count'] as int?) ?? 0;
          final oldWrong = mapData[flashcardId] ?? 0;


          return <String, dynamic>{
            'user_id': item['user_id'],
            'flashcard_id': item['flashcard_id'],
            'is_learned': item['is_learned'],
            'wrong_count': oldWrong + wrongDelta,
            'updated_at': DateTime.now().toIso8601String(),
          };
      }).toList();

      final data = await _client
      .from('user_flashcard_progress')
      .upsert(
        upsertItems,
        onConflict: 'user_id,flashcard_id',
      )
      .select() as List<dynamic>;

      return Either.right(data
        .map((e) => UserFlashcardProgressDTO
        .fromJson(e as Map<String, dynamic>)).toList()
      );
    } catch (e, st) {
      developer.log('updateFlashcardProgress error: $e');
      developer.log('$st');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
}
