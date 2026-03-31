
import 'package:app_demo/src/features/topic/application/topic_service.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_notifier.g.dart';

/// Presentation Layer - State Management (Notifier)
/// Nhiệm vụ:
/// - Gọi Service (business logic)
/// - Convert Future/Either → AsyncValue (tự động)
/// - Handle refresh/mutations
@riverpod
class TopicNotifier extends _$TopicNotifier {
  @override
  FutureOr<List<TopicModel>> build() async {
    // AsyncValue.guard() tự động catch exception
    return ref.read(topicServiceProvider).getTopicList();
  }

  /// Refresh danh sách topics
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(topicServiceProvider).getTopicList(),
    );
  }
}