import 'dart:developer' as developer;
import 'package:app_demo/src/features/flashcard/data/repository/flashcard_repository.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final flashcardServiceProvider = Provider(FlashcardService.new);

class FlashcardService {
  final Ref _ref;
  FlashcardService(this._ref);
  late final _client = _ref.read(supabaseClientProvider);
  late final _repo = _ref.read(flashcardRepoProvider);

  String get _currentUserId => _client.auth.currentUser!.id;

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
      assignedDate: Format.normalizeDate(assignedDate),
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
  })async{
    if(selectedTopicId > 0) return selectedTopicId;
    
    final daily = await getDailyFlashcards(
      topicId: selectedTopicId,
      assignedDate: Format.normalizeDate(assignedDate) ,
    );

    if(daily.isNotEmpty) return daily.first.topicId;

    final anyTopicId = await _repo.fetchAnyFlashcardInTopic();
    return anyTopicId.fold(
      ifLeft: (error) => throw error, 
      ifRight: (id) => id,
    );
  }



}