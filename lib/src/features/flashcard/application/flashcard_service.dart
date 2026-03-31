import 'dart:developer' as developer;
import 'package:app_demo/src/features/flashcard/data/flashcard_repository.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final flashcardServiceProvider = Provider(FlashcardService.new);

class FlashcardService {
  final Ref _ref;
  FlashcardService(this._ref);

  late final _repo = _ref.read(flashcardRepoProvider);

  Future<List<FlashcardModel>> fetchFlashcardById({required int topicId})
  async{

    final result = await _repo.fetchFlashcardById(topicId: topicId);
    
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


}