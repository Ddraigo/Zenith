// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_word_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyWordSummaryDTO _$DailyWordSummaryDTOFromJson(Map<String, dynamic> json) =>
    _DailyWordSummaryDTO(
      userId: json['user_id'] as String,
      topicId: (json['topic_id'] as num).toInt(),
      assignedDate: DateTime.parse(json['assigned_date'] as String),
      topicName: json['topic_name'] as String,
      totalWords: (json['total_words'] as num).toInt(),
      completedWords: (json['completed_words'] as num).toInt(),
    );

Map<String, dynamic> _$DailyWordSummaryDTOToJson(
  _DailyWordSummaryDTO instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'topic_id': instance.topicId,
  'assigned_date': instance.assignedDate.toIso8601String(),
  'topic_name': instance.topicName,
  'total_words': instance.totalWords,
  'completed_words': instance.completedWords,
};
