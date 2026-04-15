import 'package:app_demo/src/features/quiz/application/quiz_attempt_items_service.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_items_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_result_notifier.g.dart';

@riverpod
class QuizResultNotifier extends _$QuizResultNotifier {
  @override
  Future<List<QuizAttemptItemsModel>> build({
    required String quizAttempId,
  }) async {
    final result = await ref
        .read(quizAttemptItemsServiceProvider)
        .getQuizAttempItemsById(
      quizAttemptId: quizAttempId,
    );

    return result.fold(
      ifLeft: (e) => throw e,
      ifRight: (items) => items,
    );
  }

}