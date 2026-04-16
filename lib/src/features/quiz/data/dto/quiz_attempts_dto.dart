import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_attempts_dto.freezed.dart';
part 'quiz_attempts_dto.g.dart';

@freezed
abstract class QuizAttemptsDTO with _$QuizAttemptsDTO{
const factory QuizAttemptsDTO({
    required String id,

    @JsonKey(name: 'user_id')
    required String userId,

    @JsonKey(name:'topic_id') 
    required int topicId,

    @JsonKey(name:'attempt_type')
    String? attemptType,

    required int score,

    @JsonKey(name:'total_questions') 
    required int totalQuestions,

    @JsonKey(name:'correct_answers') 
    required int correctAnswers,


    @JsonKey(name:'created_at') 
    required DateTime createdAt,

  }) = _QuizAttemptsDTO;

  factory QuizAttemptsDTO.fromJson(Map<String, dynamic> json) => _$QuizAttemptsDTOFromJson(json);
}

extension QuizAttemptsDTOMapper on QuizAttemptsDTO {
  QuizAttemptsModel toDomain() {
    return QuizAttemptsModel(
      id: id,
      userId: userId,
      topicId: topicId,
      attemptType: attemptType ?? 'daily',
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      createdAt: createdAt,
    );
  }
}

