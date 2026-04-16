import 'dart:developer' as developer;
import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/flashcard/data/repository/flashcard_repository.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final flashcardServiceProvider = Provider(FlashcardService.new);

class FlashcardService {
  final Ref _ref;
  FlashcardService(this._ref);
  late final _repo = _ref.read(flashcardRepoProvider);

  String get _currentUserId => _ref.read(currentUserIdProvider);

  Future<List<FlashcardModel>> fetchFlashcardById({
    required int topicId,
  })
  async{
    
    final result = await _repo.fetchFlashcardsByTopicId(topicId: topicId);
    return result.fold(
      ifLeft: (error) {
        developer.log('FlashcardService: Error fetching topics', 
            error: error,
            stackTrace: StackTrace.current);
        throw error;
      },
      ifRight: (topics) => topics,
    );
  }

  Future<List<FlashcardModel>> getDailyFlashcards({
    int? topicId,
    DateTime? assignedDate,
  }) async {
    final result = await _repo.fetchDailyFlashcards(
      userId: _currentUserId,
      topicId: topicId ?? 0,
      assignedDate: assignedDate ?? DateTime.now(),
    );

    return result.fold(
      ifLeft: (error) {
        developer.log('FlashcardService: Error fetching topics', 
            error: error,
            stackTrace: StackTrace.current);
        throw error;
      },
      ifRight: (topics) => topics,
    );
  }

  Future<int> resolveInitialTopicId({
    required int selectedTopicId,
    DateTime? assignedDate,
  }) async {
    if (selectedTopicId > 0) return selectedTopicId;
    
    final daily = await getDailyFlashcards(
      topicId: selectedTopicId,
      assignedDate: assignedDate,
    );

    if (daily.isNotEmpty) return daily.first.topicId;

    final anyTopicIdResult = await _repo.fetchAnyFlashcardInTopic();
    return anyTopicIdResult.fold(
      ifLeft: (error) {
        developer.log(
          'FlashcardService: Error resolving initial topic id',
          error: error,
          stackTrace: StackTrace.current,
        );
        throw error;
      },
      ifRight: (topicId) => topicId,
    );
    
  }

}