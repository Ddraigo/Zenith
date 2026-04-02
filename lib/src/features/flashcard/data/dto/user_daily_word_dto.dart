import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_daily_word_dto.freezed.dart';
part 'user_daily_word_dto.g.dart';

@freezed
abstract class UserDailyWordDTO with _$UserDailyWordDTO{
  const factory UserDailyWordDTO({
    required String userId,

    @JsonKey(name:'flashcard_id')
    required String flashcardId,

    @JsonKey(name: 'topic_id')
    int? topicId,

    @JsonKey(name: 'assigned_date')
    required DateTime assignedDate,
    
    @JsonKey(name: 'is_completed')
    bool? isCompleted,

    @JsonKey(name: 'created_at')
    DateTime? createdAt,

  }) = _UserDailyWordDTO;

  factory UserDailyWordDTO.fromJson(Map<String,dynamic> json) => _$UserDailyWordDTOFromJson(json);
}

extension UserDailyWordDTOMapper on UserDailyWordDTO{
  UserDailyWordModel toDomain(){
    return UserDailyWordModel(
      userId: userId, 
      flashcardId: flashcardId,
      topicId: topicId,
      assignedDate: assignedDate,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }
}