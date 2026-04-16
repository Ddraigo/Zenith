
import 'package:app_demo/src/core/data/dto/user_flashcard_progress_dto.dart';
import 'package:app_demo/src/core/data/source/user_flashcard_progress_source.dart';
import 'package:app_demo/src/core/domain/user_flashcard_progress_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userFlashcardProgressRepoProvider = Provider(
  (ref) => UserFlashcardProgressRepo(ref.read(userFlashcardProgressSourceProvider)));

class UserFlashcardProgressRepo {
  final UserFlashcardProgressSource _source;
  UserFlashcardProgressRepo(this._source);

  Future<Either<AppException, List<UserFlashcardProgressModel>>> updateFlashcardProgress({
    required List<UserFlashcardProgressModel> items,
  }) async {

    final mapItems = items.map((e)=>e.toJson()).toList();
    final result =  await _source.updateFlashcardProgress(items: mapItems);
    return result.map((items){
      return items.map((dto) => dto.toDomain()).toList();
    });
  }

  Future<Either<AppException, List<UserFlashcardProgressModel>>> fetchFlashcardProgress({
    required String userId,
  }) async {
    final result = await _source.fetchFlashcardProgress(userId: userId);
    return result.map((item){
      return item.map((dto) => dto.toDomain()).toList();
    });
  }

}