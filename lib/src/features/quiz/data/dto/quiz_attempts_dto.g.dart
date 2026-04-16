// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAttemptsDTO _$QuizAttemptsDTOFromJson(Map<String, dynamic> json) =>
    _QuizAttemptsDTO(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      topicId: (json['topic_id'] as num).toInt(),
      attemptType: json['attempt_type'] as String?,
      score: (json['score'] as num).toInt(),
      totalQuestions: (json['total_questions'] as num).toInt(),
      correctAnswers: (json['correct_answers'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$QuizAttemptsDTOToJson(_QuizAttemptsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'topic_id': instance.topicId,
      'attempt_type': instance.attemptType,
      'score': instance.score,
      'total_questions': instance.totalQuestions,
      'correct_answers': instance.correctAnswers,
      'created_at': instance.createdAt.toIso8601String(),
    };
