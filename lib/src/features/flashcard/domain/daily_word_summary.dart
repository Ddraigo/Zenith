import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_word_summary.freezed.dart';
@freezed
abstract class DailyWordSummaryModel with _$DailyWordSummaryModel{

  const DailyWordSummaryModel._(); //Phai co de viet getter

  const factory DailyWordSummaryModel({
    required String userId,
    required int topicId,
    required DateTime assignedDate,
    required String topicName,
    required int totalWords,
    @Default(0) int? completedWords,

  }) = _DailyWordSummaryModel;

  String get progress{
    if(totalWords == 0){
      return '0';
    }
    return '$completedWords/$totalWords';
  }

  double get progressPrecent{
    if(totalWords == 0) return 0;
    final complete = completedWords ?? 0;
    return complete/totalWords;
  }
}