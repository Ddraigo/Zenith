import 'package:app_demo/src/features/quiz/data/source/quiz_attempt_items_source.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_items_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizAttemptItemsRepoProvider = Provider(
  (ref) => QuizAttemptItemsRepo(ref.read(quizAttemptItemsSourceProvider)),
);

class QuizAttemptItemsRepo {
  final QuizAttemptItemsSource _source;
  QuizAttemptItemsRepo(this._source);

  Future<Either<AppException, bool>> insertQuizAttempItems({
    required List<QuizAttemptItemsModel> items,
  }) async {
    final mapItems = items.map((e) => e.toJson()).toList();
    await _source.insertQuizAttempItems(items: mapItems);
    return Either.right(true);
  }

}
