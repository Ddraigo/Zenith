import 'package:app_demo/src/features/flashcard/application/flashcard_service.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_notifier.g.dart';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId
@riverpod
class FlashcardNotifier extends _$FlashcardNotifier {
  @override
  FutureOr<List<FlashcardModel>> build() async {
    final topicId = ref.watch(selectedTopicProvider);
    return ref.read(flashcardServiceProvider).getDailyFlashcards(topicId: topicId);
  }

  /// Refresh danh sách flashcards
  Future<void> refresh() async {
    state = const AsyncLoading();
    final topicId = ref.read(selectedTopicProvider);
    state = await AsyncValue.guard(
      () => ref.read(flashcardServiceProvider).getDailyFlashcards(
        topicId: topicId,
      ),
    );
  }
}