import 'package:app_demo/src/features/ai_support/data/dto/ai_support_response_dto.dart';
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
      final data = (res.data is Map)
          ? Map<String, dynamic>.from(res.data as Map)
          : const <String, dynamic>{};

      return Either.right(AISupportResponseDTO.fromJson(data));
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
      
  }


}