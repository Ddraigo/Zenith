import 'package:app_demo/src/core/domain/user_flashcard_progress_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_flashcard_progress_dto.freezed.dart';
part 'user_flashcard_progress_dto.g.dart';

@freezed
abstract class UserFlashcardProgressDTO with _$UserFlashcardProgressDTO{
  const factory UserFlashcardProgressDTO({
    required String userId,

    @JsonKey(name:'flashcard_id')
    required String flashcardId,

    @JsonKey(name: 'is_learned')
    bool? isLearned,

    @JsonKey(name: 'wrong_count')
    int? wrongCount,
    
    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,

  }) = _UserFlashcardProgressDTO;

  factory UserFlashcardProgressDTO.fromJson(Map<String,dynamic> json) => _$UserFlashcardProgressDTOFromJson(json);
}

extension UserDailyWordDTOMapper on UserFlashcardProgressDTO{
  UserFlashcardProgressModel toDomain(){
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