import 'package:app_demo/src/features/flashcard/application/flashcard_service.dart';
import 'package:app_demo/src/features/flashcard/application/user_daily_word_service.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/features/flashcard/presentation/controller/flashcard_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/controller/topic_flashcard_notifier.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/flashcard/domain/daily_word_summary.dart';
import '../../features/topic/application/topic_service.dart';
import '../../features/topic/domain/topic_model.dart';
import '../../shared/constants/format.dart';

part 'shared_flashcard_notifier.g.dart';

final selectedTopicDaily = StateProvider<int>((ref)=>0);
final selectedTopicProvider = StateProvider<int?>((ref) => 0);
final flashcardIndexProvider = StateProvider<int>((ref) => 0);
// Track xem user đang xem daily hay full topic
final isDailyModeProvider = StateProvider<bool>((ref) => true);
// Track ngày được chọn từ daily
final selectedDateProvider = StateProvider<DateTime?>((ref) => null);

/// Resolve topicId thực tế từ selectedTopicId
/// - Nếu selectedTopicId > 0 → trả về nó
/// - Nếu selectedTopicId = 0 → lấy từ daily hoặc topic random
@riverpod
Future<int> resolvedTopicId( Ref ref, int selectedTopicId)async{
  return ref.watch(flashcardServiceProvider).resolveInitialTopicId(
    selectedTopicId: selectedTopicId,
  );
}

@riverpod
Future<List<TopicModel>> getTopicList(Ref ref)async{
  return ref.read(topicServiceProvider).getTopicList();
}

/// Lấy flashcards đã xử lý logic hôm nay/tất cả
/// - Nếu isDailyMode=true + selectedDate!=null → lấy daily flashcards của date + topic
/// - Nếu isDailyMode=false → lấy tất cả flashcards của topic
@riverpod
Future<List<FlashcardModel>> getFlashcards( Ref ref, int selectedTopicId)async{
  final isDaily = ref.watch(isDailyModeProvider);
  final selectedDate = ref.watch(selectedDateProvider);
  
  // Xem flashcards của date + topic cụ thể từ daily list
  if(isDaily && selectedTopicId > 0 && selectedDate != null){
    return await ref.watch(flashcardProvider(selectedTopicId, assignedDate: selectedDate).future);
  }

  // Xem tất cả flashcards của topic
  if(!isDaily && selectedTopicId > 0){
    return await ref.watch(topicFLashcardProvider(selectedTopicId).future);
  }

  // Xem hôm nay (selectedTopicId = 0) - resolve topicId thực tế
  final topicId = await ref.watch(resolvedTopicIdProvider(selectedTopicId).future);
  final daily = await ref.watch(flashcardProvider(topicId).future);
  if(daily.isNotEmpty) return daily;

  return await ref.watch(topicFLashcardProvider(topicId).future);
}

@riverpod
Future<Map<DateTime, List<DailyWordSummaryModel>>> getDailyTopicsGrouped (
  Ref ref,
  {required int dayRange}) async{
    return ref.watch(userDailyWordServiceProvider)
    .getDailyTopicsGrouped(dayRange: dayRange);
}

@riverpod
Future<Map<DateTime, List<DailyWordSummaryModel>>> getDailyAllTopicsGrouped (Ref ref) async{
    return ref.watch(userDailyWordServiceProvider)
    .getDailyTopicsGrouped(startDate: DateTime(1999,1,1));
}



@riverpod
String  formatDailyDate(Ref ref, DateTime date) {
  final today = DateTime.now();
  final todayOnly = Format.normalizeDate(today);

  if(date == todayOnly){
    return 'Hôm nay';
  }else if(date.add(Duration(days: 1)) == todayOnly){
    return 'Hôm qua';
  }else{
    return Format.formatDMY(date);
  }
  
}