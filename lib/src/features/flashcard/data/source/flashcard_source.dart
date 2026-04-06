
import 'dart:developer';

import 'package:app_demo/src/features/flashcard/data/dto/flashcard_dto.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final flashcardSourceProvider = Provider<FlashcardSource>(
  (ref) => FlashcardSource(ref.read(supabaseClientProvider)),
);

class FlashcardSource {
  final SupabaseClient _client;

  FlashcardSource(this._client);

  /// Fetch Flashcard
  Future<Either<AppException, List<FlashcardDTO>>> fetchFlashcard() async {
    // 2 cách dùng either
    try {
      final data = await _client
                .from('flashcards')
                .select() as List<dynamic>;
                
    return Either.right(data
                        .map((e) => FlashcardDTO.fromJson(e as Map<String, dynamic>))
                        .toList());    
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  /// Tạo flashcard mới
  Future<Either<AppException, FlashcardDTO>> createFlashcard({
    required String deckId,
    required FlashcardDTO flashcardDTO,
  }) {
    return Either.catchFutureError(
      (error, _) => SupabaseErrorHandle.handle(error),
      () async {
        final data = await _client
            .from('flashcards')
            .insert(flashcardDTO.toJson());
        return FlashcardDTO.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  /// Lấy danh sách flashcard theo topic
  Future<Either<AppException, List<FlashcardDTO>>> getFlashcardByTopicId({
    required int topicId,
  }) {
    return Either.catchFutureError(
      (error, _) => SupabaseErrorHandle.handle(error),
      () async {
        final data = await _client
            .from('flashcards')
            .select()
            .eq('topic_id', topicId) as List<dynamic>;

        return data
            .map((e) => FlashcardDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<Either<AppException, List<FlashcardDTO>>> fetchFlashcardDailyWord({
    required String userId,
    required int topicId,
    required DateTime assignedDate,
  }) async{
    try {
      var query = _client
                    .from('user_daily_word')
                    .select('flashcards(*)')
                    .eq('user_id', userId)
                    .eq('assigned_date', assignedDate);
      
      if(topicId != 0){
        query = query.eq('topic_id', topicId);
      }

      final data = await query as List<dynamic>;
      inspect(data);
      return Either.right(data
                        .map((e) => FlashcardDTO.fromJson((e as Map<String, dynamic>)['flashcards'] as Map<String, dynamic>))
                        .toList());
          
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, int>> fetchAnyFlashcardInTopic()async{
    try {
      final data = await _client  
                        .from('flashcards')
                        .select('topic_id')
                        .limit(1) as List<dynamic>;

      if(data.isEmpty) return Either.right(0);
      return Either.right((data.first as Map<String, dynamic>)['topic_id'] as int);
                
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }


}