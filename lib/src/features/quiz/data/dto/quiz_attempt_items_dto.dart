import 'package:app_demo/src/features/quiz/domain/quiz_attempt_items_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_attempt_items_dto.freezed.dart';
part 'quiz_attempt_items_dto.g.dart';

@freezed
abstract class QuizAttemptItemsDTO with _$QuizAttemptItemsDTO{
const factory QuizAttemptItemsDTO({
    required String id,

    @JsonKey(name: 'attempt_id')
    required String attemptId,

    @JsonKey(name:'flashcard_id') 
    required String flashcardId,


    @JsonKey(name:'is_correct') 
    required bool isCorrect,

    @JsonKey(name:'created_at') 
    required DateTime createdAt,

  }) = _QuizAttemptItemsDTO;

  factory QuizAttemptItemsDTO.fromJson(Map<String, dynamic> json) => _$QuizAttemptItemsDTOFromJson(json);
}

extension QuizAttemptItemsDTOMapper on QuizAttemptItemsDTO {
  QuizAttemptItemsModel toDomain() {
    return QuizAttemptItemsModel(
      id: id,
      attemptId: attemptId,
      flashcardId: flashcardId,
      isCorrect: isCorrect,
      createdAt: createdAt,
    );
  }
}

