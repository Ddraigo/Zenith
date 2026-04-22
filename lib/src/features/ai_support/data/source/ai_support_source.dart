import 'package:app_demo/src/features/ai_support/data/dto/ai_support_response_dto.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final aiSupportSourceProvider = Provider(
  (ref) => AISupportSource(ref.read(supabaseClientProvider)));

class AISupportSource {
  final SupabaseClient _client;
  AISupportSource(this._client);

  Future<Either<AppException, AISupportResponseDTO>> getAISupport({
    required String flashcardId,
  })async{
    try {
      // final data = await _client
      //                 .from('ai_flashcard_support')
      //                 .select()
      //                 .eq('flashcard_id', flashcardId)
      //                 .maybeSingle() as Map<String, dynamic>;

      final res = await _client.functions
                      .invoke(
                        'ai_flashcard_support', 
                        body: {'flashcard_id': flashcardId}
                      );
      final raw = (res.data is Map)
          ? Map<String, dynamic>.from(res.data as Map)
          : <String, dynamic>{};

      // Keep a stable JSON shape so quota/pending responses do not crash parsing.
      final normalized = <String, dynamic>{
        'cached': raw['cached'] ?? false,
        'source': Format.asString(raw['source']).isEmpty
            ? 'unknown'
            : Format.asString(raw['source']),
        'data': Format.asMap(raw['data']),
        'phonetic': Format.asString(raw['phonetic']),
        'audio': Format.asString(raw['audio']),
      };

      return Either.right(AISupportResponseDTO.fromJson(normalized));
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
      
  }


}