import 'package:app_demo/src/features/quiz/data/dto/quiz_attempt_items_dto.dart';
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

  Future<Either<AppException, List<QuizAttemptItemsModel>>> insertQuizAttempItems({
    required List<QuizAttemptItemsModel> items,
  }) async {
    final mapItems = items.map((e) => e.toJson()).toList();
    final result = await _source.insertQuizAttempItems(items: mapItems);
    return result.map((items){
      return items.map((dto) => dto.toDomain()).toList();
    });
  }

  Future<Either<AppException, List<QuizAttemptItemsModel>>> getQuizAttempItemsById({
    required String quizAttemptId,
  })async{
    final result = await _source.fetchQuizAttempItemsById(quizAttemptId: quizAttemptId);
    return result.map((items){
      return items.map((dto) => dto.toDomain()).toList();
    });
  }

}
