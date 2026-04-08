
import 'package:app_demo/src/features/quiz/data/dto/quiz_attempts_dto.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../shared/http/app_exception.dart';

final quizAttemptsSourceProvider = Provider<QuizAttemptsSource>(
  (ref) => QuizAttemptsSource(ref.read(supabaseClientProvider)));

class QuizAttemptsSource{
  final SupabaseClient _client;
  QuizAttemptsSource(this._client);

  Future<Either<AppException, QuizAttemptsDTO>> insertQuizAttemp({
    required String userId,
    required int topicId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,

  }) async {
    try {
      final data = await _client
                .from('quiz_attempts')
                .insert({
                'user_id': userId,
                'topic_id': topicId,
                'score': score,
                'total_questions': totalQuestions,
                'correct_answers': correctAnswers,
              })
              .select()
              .single();
                
    return Either.right(QuizAttemptsDTO.fromJson(data));
                          
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, QuizAttemptsDTO>> updateQuizAttemp({
    required String userId,
    int? topicId,
    required int score,
    required int totalQuestions,
    required int correctAnswers, 
  })async{
    try {
      final data = await _client
                .from('quiz_attempts')
                .insert({
                'user_id': userId,
                'topic_id': topicId,
                'score': score,
                'total_questions': totalQuestions,
                'correct_answers': correctAnswers,
              })
              .select()
              .single();
                
    return Either.right(QuizAttemptsDTO.fromJson(data));
                          
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

}