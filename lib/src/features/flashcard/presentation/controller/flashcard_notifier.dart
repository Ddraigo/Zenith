import 'package:app_demo/src/features/flashcard/application/flashcard_service.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_notifier.g.dart';

/// Presentation Layer - State Management (Notifier)
/// Quản lý flashcards theo topicId và assignedDate
@riverpod
class FlashcardNotifier extends _$FlashcardNotifier {
  @override
  FutureOr<List<FlashcardModel>> build(int topicId, {DateTime? assignedDate}) async {
    // assignedDate = null → getDailyFlashcards sẽ mặc định = hôm nay
    return ref.read(flashcardServiceProvider).getDailyFlashcards(
      topicId: topicId,
      assignedDate: assignedDate,
    );
  }

  /// Refresh danh sách flashcards
  Future<void> refresh(int topicId, {DateTime? assignedDate}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(flashcardServiceProvider).getDailyFlashcards(
        topicId: topicId,
        assignedDate: assignedDate,
      ),
    );
  }

}