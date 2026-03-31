
import 'package:app_demo/src/features/flashcard/data/flashcard_dto.dart';
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
}