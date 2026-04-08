import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userFlashcardProgressSourceProvider = Provider(
  (ref) => UserFlashcardProgressSource(ref.read(supabaseClientProvider)),
);

class UserFlashcardProgressSource {
  final SupabaseClient _client;
  UserFlashcardProgressSource(this._client);

  Future<Either<AppException, bool>> updateFlashcardProgress({
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      await _client.from('user_flashcard_progress').upsert(items);

      return const Either.right(true);
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
}
