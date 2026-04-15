
import 'package:app_demo/src/features/quiz/data/repository/quiz_attempt_items_repo.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_items_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizAttemptItemsServiceProvider = Provider(QuizAttemptItemsService.new);

class QuizAttemptItemsService {
  final Ref _ref;
  QuizAttemptItemsService(this._ref);
  late final QuizAttemptItemsRepo _repo = _ref.read(quizAttemptItemsRepoProvider);

  Future<Either<AppException, List<QuizAttemptItemsModel>>> insertQuizAttempItems({
    required List<QuizAttemptItemsModel> items,
  }) async {
    if(items.isEmpty){
      return Either.left(AppException.errorWithMessage('insertQuizAttempItems: Không có item nào để lưu'));
    }
    final result  = await _repo.insertQuizAttempItems(items: items);
    return result.fold(
      ifLeft: (e) => e.left(),
      ifRight: (items) {
        if (items.isEmpty) {
          return Either.left(AppException.errorWithMessage('Không có danh sách nào'));
        }
        return Either.right(items);
      },
    );
  }

  Future<Either<AppException, List<QuizAttemptItemsModel>>> getQuizAttempItemsById({
    required String quizAttemptId,
  }) async {
    if(quizAttemptId.isEmpty ){
      return Either.left(AppException.badRequest('attempId isEmpty'));
    }
    final result = await _repo.getQuizAttempItemsById(quizAttemptId: quizAttemptId);

    return result.fold(
      ifLeft: (e) => e.left(),
      ifRight: (items) {
        if (items.isEmpty) {
          return Either.left(AppException.errorWithMessage('Không có danh sách nào'));
        }
        return Either.right(items);
      },
    );
  }
  
}