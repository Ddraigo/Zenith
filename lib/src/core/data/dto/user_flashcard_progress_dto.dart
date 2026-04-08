import 'package:app_demo/src/core/domain/user_flashcard_progress_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_flashcard_progress_dto.g.dart';
part 'user_flashcard_progress_dto.freezed.dart';

@freezed
abstract class UserFlashcardProgressDTO with _$UserFlashcardProgressDTO{
  const factory UserFlashcardProgressDTO({
    
    @JsonKey(name: 'user_id') required String userId,

    @JsonKey(name: 'flashcard_id') required String flashcardId,

    @JsonKey(name: 'is_learned') required bool isLearned,
    
    @JsonKey(name: 'wrong_count') required int wrongCount,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserFlashcardProgressDTO;

  factory UserFlashcardProgressDTO.fromJson(Map<String, dynamic> json) =>
      _$UserFlashcardProgressDTOFromJson(json);
}

extension UserFlashcardProgressDTOMapper on UserFlashcardProgressDTO {
  UserFlashcardProgressModel toDomain() {
    return UserFlashcardProgressModel(
      userId: userId,
      flashcardId: flashcardId,
      isLearned: isLearned,
      wrongCount: wrongCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}