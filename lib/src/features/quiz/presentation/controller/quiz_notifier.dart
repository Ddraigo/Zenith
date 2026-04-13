import 'package:app_demo/src/features/quiz/application/quiz_attempts_service.dart';
import 'package:app_demo/src/features/quiz/domain/question_model.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_args.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_notifier.g.dart';

@riverpod
class QuizSessionNotifier extends _$QuizSessionNotifier {
  @override
  Future<QuestionModel> build(
    QuizAttemptType type,
    int topicId,
    DateTime? assignedDate,
  ) async {
    return ref
        .read(quizAttemptsServiceProvider)
        .createQuestion(
          type: type,
          topicId: topicId,
          assignedDate: assignedDate,
        );
  }

  void setAnswer(String flashcardId, String answer) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      current.updateAnswer(flashcardId: flashcardId, answer: answer),
    );
  }

  void clearAnswer(String flashcardId) {
    final current = state.value;
    if (current == null) return;

    final updated = Map<String, String>.from(current.userAnswers);
    updated.remove(flashcardId);
    state = AsyncData(current.copyWith(userAnswers: updated));
  }

  void saveAndNext({required String flashcardId, required String answer}) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      current.copyWith(
        userAnswers: {...current.userAnswers, flashcardId: answer.trim()},
      ),
    );
  }

  Future<Either<AppException, QuizAttemptsModel>> submitQuiz() async {
    final session = state.value;

    if (session == null) {
      return Either.left(
        AppException.errorWithMessage('Chưa có dữ liệu bài quiz để nộp'),
      );
    }

    return ref.read(quizAttemptsServiceProvider).submitQuiz(
      session: session, 
      args: QuizAttemptArgs(
        type: type,
        topicId: topicId,
        assignedDate: assignedDate,
        ),
      );
  }

  
}
