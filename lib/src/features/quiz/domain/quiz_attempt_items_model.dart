import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_attempt_items_model.freezed.dart';

@freezed
abstract class QuizAttemptItemsModel with _$QuizAttemptItemsModel{
  const factory QuizAttemptItemsModel({
    required String id,

    required String attemptId,

    required String flashcardId,

    required bool isCorrect,

    DateTime? createdAt,

  }) = _QuizAttemptItemsModel;
}


extension QuizAttemptItemsModelMapper on QuizAttemptItemsModel {
  Map<String, dynamic> toJson() =>{
    'attempt_id': attemptId,
    'flashcard_id': flashcardId,
    'is_correct': isCorrect,
    'created_at': createdAt?.toIso8601String(),
  };
}
