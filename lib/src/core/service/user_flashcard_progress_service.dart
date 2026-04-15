
import 'package:app_demo/src/core/data/repository/user_flashcard_progress_repo.dart';
import 'package:app_demo/src/core/domain/user_flashcard_progress_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/current_user_id_notifire.dart';

final userFlashcardProgressServiceProvider = Provider(UserFlashcardProgressService.new);

class UserFlashcardProgressService {
  final Ref _ref;
  UserFlashcardProgressService(this._ref);
  late final _repo = _ref.read(userFlashcardProgressRepoProvider);
  late final _currentUserId = _ref.read(currentUserIdProvider);

  Future<Either<AppException, List<UserFlashcardProgressModel>>> updateFlashcardProgress({
    required List<UserFlashcardProgressModel> items,
  })async{
    if(items.isEmpty){
      return Either.left(AppException.errorWithMessage('updateFlashcardProgress: Không có item nào để lưu'));
    }

    final progressItems = items.map((data) =>
      UserFlashcardProgressModel(
        userId: _currentUserId, 
        flashcardId: data.flashcardId, 
        isLearned: data.isLearned,
        wrongCount: data.wrongCount,
      )
    ).toList();
    final result = await _repo.updateFlashcardProgress(items: progressItems);

    return result.fold(
      ifLeft: (e) => e.left(), 
      ifRight: (items){
        if (items.isEmpty) {
          return Either.left(AppException.errorWithMessage('Không có danh sách nào'));
        }
        return Either.right(items);
      },
    );
  }
}