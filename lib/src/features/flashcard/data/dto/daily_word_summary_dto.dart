import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_word_summary_dto.g.dart';
part 'daily_word_summary_dto.freezed.dart';

@freezed
abstract class DailyWordSummaryDTO with _$DailyWordSummaryDTO {
  const factory DailyWordSummaryDTO({
    @JsonKey(name:'user_id') 
    required String userId,

    @JsonKey(name:'topic_id') 
    required int topicId,

    @JsonKey(name: 'assigned_date')
    required DateTime assignedDate,

    @JsonKey(name: 'topic_name')
    required String topicName,

    @JsonKey(name: 'total_words')
    required int totalWords,

    @JsonKey(name: 'completed_words')
    required int completedWords,

  }) = _DailyWordSummaryDTO;

  factory DailyWordSummaryDTO.fromJson(Map<String, dynamic> json) => _$DailyWordSummaryDTOFromJson(json);
}

extension DailyWordSummaryDTOMapper on DailyWordSummaryDTO {
  DailyWordSummaryModel toDomain() {
    return DailyWordSummaryModel(
      userId: userId,
      topicId: topicId,
      assignedDate: assignedDate,
      topicName: topicName,
      totalWords: totalWords,
      completedWords: completedWords
    );
  }
}