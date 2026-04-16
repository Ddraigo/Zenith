
import 'package:app_demo/src/features/quiz/data/dto/quiz_attempt_items_dto.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../shared/http/app_exception.dart';

final quizAttemptItemsSourceProvider = Provider<QuizAttemptItemsSource>(
  (ref) => QuizAttemptItemsSource(ref.read(supabaseClientProvider)));

class QuizAttemptItemsSource{
  final SupabaseClient _client;
  QuizAttemptItemsSource(this._client);

  Future<Either<AppException, List<QuizAttemptItemsDTO>>> insertQuizAttempItems({
    required List<Map<String, dynamic>> items,

  }) async {
    try {
      
      final data = await _client
                .from('quiz_attempt_items')
                .insert(items)
              .select() as List<dynamic>;
                
    return Either.right(
      data.map((e) => QuizAttemptItemsDTO.fromJson(e as Map<String, dynamic>)).toList());
                          
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, List<QuizAttemptItemsDTO>>> fetchQuizAttempItemsById({
    required String quizAttemptId,
  })async{
    try {
      final data = await _client
            .from('quiz_attempt_items')
            .select()
            .eq('attempt_id', quizAttemptId) as List<dynamic>;
      
      return Either.right(
        data.map((e) => QuizAttemptItemsDTO.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
    
  }
}