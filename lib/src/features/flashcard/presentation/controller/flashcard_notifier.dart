import 'package:app_demo/src/features/flashcard/application/flashcard_service.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_notifier.g.dart';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId
@riverpod
class FlashcardNotifier extends _$FlashcardNotifier {
  @override
  FutureOr<List<FlashcardModel>> build(int topicId) async {
    // Gọi Service (không gọi Repo trực tiếp)
    return ref.read(flashcardServiceProvider).fetchFlashcardById(
      topicId: topicId,
    );
  }

  /// Refresh danh sách flashcards
  Future<void> refresh(int topicId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(flashcardServiceProvider).fetchFlashcardById(
        topicId: topicId,
      ),
    );
  }
}