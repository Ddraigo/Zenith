// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempt_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAttemptItemsDTO _$QuizAttemptItemsDTOFromJson(Map<String, dynamic> json) =>
    _QuizAttemptItemsDTO(
      id: json['id'] as String,
      attemptId: json['attempt_id'] as String,
      question: json['question'] as String,
      userAnswer: json['user_answer'] as String,
      isCorrect: json['is_correct'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$QuizAttemptItemsDTOToJson(
  _QuizAttemptItemsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'attempt_id': instance.attemptId,
  'question': instance.question,
  'user_answer': instance.userAnswer,
  'is_correct': instance.isCorrect,
  'created_at': instance.createdAt.toIso8601String(),
};
