import 'package:app_demo/src/features/flashcard/data/dto/flashcard_dto.dart';
import 'package:app_demo/src/features/flashcard/data/source/flashcard_source.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardRepoProvider = Provider<FlashcardRepository>((ref) {
  final source = ref.read(flashcardSourceProvider);
  return FlashcardRepository(source);
});

class FlashcardRepository {
  final FlashcardSource _source;
  FlashcardRepository(this._source);

  Future<Either<AppException, List<FlashcardModel>>> fetchFlashcard() async{
    final result = await _source.fetchFlashcard();

    return result.map((flashcard){
      return flashcard.map((dto) => dto.toDomain()).toList();
    });
  }

  Future<Either<AppException, List<FlashcardModel>>> fetchFlashcardsByTopicId({
    required int topicId,
  }) async {
    final result = await _source.getFlashcardByTopicId(topicId: topicId);
    
    return result.map((flashcardDTO) {
      return flashcardDTO.map((dto) => dto.toDomain()).toList();
    });
  }


  Future<Either<AppException, List<FlashcardModel>>> fetchDailyFlashcards({
    required String userId,
    required int topicId,
    required DateTime assignedDate,
  })async{
    final result = await _source.fetchFlashcardDailyWord(
      userId: userId,
      topicId: topicId,
      assignedDate: assignedDate,
    );
    return result.map((dailyword){
      return dailyword.map((dto) => dto.toDomain()).toList();
    });
  }


}
