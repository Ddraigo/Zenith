import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_flashcard_progress_model.freezed.dart';

@freezed
abstract class UserFlashcardProgressModel with _$UserFlashcardProgressModel{
  const factory UserFlashcardProgressModel({

    required String userId,
    required String flashcardId,

    required bool isLearned,

    required int wrongCount,
    
    DateTime? createdAt,

    DateTime? updatedAt,

  }) = _UserFlashcardProgressModel;
}

extension UserFlashcardProgressModelMapper on UserFlashcardProgressModel {
  Map<String, dynamic> toJson() =>{
    'user_id': userId,
    'flashcard_id': flashcardId,
    'is_learned': isLearned,
    'wrong_count': wrongCount,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
