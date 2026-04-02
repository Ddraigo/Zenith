

import 'package:app_demo/src/features/topic/application/topic_service.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_topic_notifier.g.dart';

/// Presentation Layer - State Management (Notifier)
/// Nhiệm vụ:
/// - Gọi Service (business logic)
/// - Convert Future/Either → AsyncValue (tự động)
/// - Handle refresh/mutations
@riverpod
class ListTopicNotifier extends _$ListTopicNotifier {
  @override
  FutureOr<List<TopicModel>> build() async {
    return ref.read(topicServiceProvider).getTopicList();
  }

  // Future<List<FlashcardModel>> fetchFlashcardById({required int topicId}) async{
  //   return ref.read(flashcardServiceProvider).fetchFlashcardById(
  //         topicId: topicId,
  //   );
  // }
  

  /// Refresh danh sách topics
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(topicServiceProvider).getTopicList(),
    );
  }
}