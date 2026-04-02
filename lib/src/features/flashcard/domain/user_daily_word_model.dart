import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_daily_word_model.freezed.dart';

@freezed
abstract class UserDailyWordModel with _$UserDailyWordModel{
  const factory UserDailyWordModel({
    required String userId,
    required String flashcardId,
    @Default(0) int? topicId,
    required DateTime assignedDate,
    @Default(false) bool? isCompleted,
    DateTime? createdAt,

  }) = _UserDailyWordModel;
 
}