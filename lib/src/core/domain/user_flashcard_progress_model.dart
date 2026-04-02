import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_flashcard_progress_model.freezed.dart';

@freezed
abstract class UserFlashcardProgressModel with _$UserFlashcardProgressModel{
  const factory UserFlashcardProgressModel({

    required String userId,
    required String flashcardId,

    @Default(false)
    bool? isLearned,

    @Default(-1)
    int? wrongCount,
    
    DateTime? createdAt,

    DateTime? updatedAt,

  }) = _UserFlashcardProgressModel;

}