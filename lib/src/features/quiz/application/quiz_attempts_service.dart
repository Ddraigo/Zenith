import 'dart:developer' as developer;
import 'dart:math';

import 'package:app_demo/src/features/flashcard/application/flashcard_service.dart';
import 'package:app_demo/src/features/quiz/application/quiz_attempt_items_service.dart';
import 'package:app_demo/src/features/quiz/domain/question_model.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_items_model.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempt_args.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/controller/current_user_id_notifire.dart';
import '../../flashcard/domain/flashcard_model.dart';
import '../data/repository/quiz_attempts_repo.dart';

final quizAttemptsServiceProvider = Provider(QuizAttemptsService.new);

class QuizAttemptsService {
  final Ref _ref;
  QuizAttemptsService(this._ref);

  late final QuizAttemptsRepo _repo = _ref.read(quizAttemptsRepoProvider);
  late final _currentUserId = _ref.read(currentUserIdProvider);
  late final QuizAttemptItemsService _attemptItemsService = _ref.read(
    quizAttemptItemsServiceProvider,
  );
  late final FlashcardService _flashcardService = _ref.read(
    flashcardServiceProvider,
  );

  Future<Either<AppException, QuizAttemptsModel>> insertQuizAttemp({
    required int topicId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
  }) async {
    final result = await _repo.insertQuizAttemp(
      userId: _currentUserId,
      topicId: topicId,
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
    );
    return result.fold(
      ifLeft: (error) {
        developer.log(
          'UserDailyWordService: Error fetching data',
          error: error,
          stackTrace: StackTrace.current,
        );
        return error.left();
      },
      ifRight: (data) => data.right(),
    );
  }

  Future<QuestionModel> createQuestion({
    required QuizAttemptType type,
    required int topicId,
    DateTime? assignedDate,
  }) async {
    final flashcards = await _getFlashcardByTypeQuiz(
      type: type,
      topicId: topicId,
      assignedDate: assignedDate,
    );
    final questions = flashcards.map((flashcard) {
      return QuestionItem(
        flashcardId: flashcard.id ?? '',
        question: flashcard.meaning,
        correctAnswer: flashcard.word,
      );
    }).toList();
    final random = Random();
    questions.shuffle(random);

    return QuestionModel(
      topicId: topicId,
      questions: questions,
      userAnswers: {},
    );
  }

  Future<List<FlashcardModel>> _getFlashcardByTypeQuiz({
    required QuizAttemptType type,
    required int topicId,
    DateTime? assignedDate,
  }) async {
    switch (type) {
      case QuizAttemptType.today:
        return _flashcardService.getDailyFlashcards(
          topicId: 0,
          assignedDate: DateTime.now(),
        );
      case QuizAttemptType.daily:
        return _flashcardService.getDailyFlashcards(
          topicId: topicId,
          assignedDate: assignedDate ?? DateTime.now(),
        );
      case QuizAttemptType.topic:
        return _flashcardService.fetchFlashcardById(topicId: topicId);
    }
  }

  Future<Either<AppException, QuizAttemptsModel>> submitQuiz({required QuestionModel session}) async {
    if(session.questions.isEmpty){
      return Either.left(AppException.errorWithMessage('Không có câu hỏi nào được tìm thấy'));
    }
    final totalQuestions = session.questions.length;
    final correctAnswers = _calculateCorrectAnswers(session);
    final score = _calculateScore(correctAnswers, totalQuestions);

    final answeredCount = session.questions.where(
      (q) => (session.userAnswers[q.flashcardId] ?? '').trim().isNotEmpty).length;

    if(answeredCount < totalQuestions){
      return Either.left(AppException.errorWithMessage('Chưa trả lời hết tất cả câu hỏi'));
    }
    final attempt = await insertQuizAttemp(
      topicId: session.topicId,
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
    );

    return await attempt.fold(
      ifLeft: (e) async => e.left(), 
      ifRight: (attempt) async{
        if(attempt.id.isEmpty){
          return Either.left(AppException.errorWithMessage('attempId isEmpty'));
        }

        final items = _buildAttemptItems(attemptId: attempt.id, session: session);

        if(items.isEmpty){
          return Either.left(AppException.errorWithMessage('_buildAttemptItems isEmpty'));
        }

        final insertItem = await _attemptItemsService.insertQuizAttempItems(
          items: items,
        );

        return insertItem.fold(
          ifLeft: (error) {
            developer.log(
              'QuizAttemptsService.submitQuiz item insert failed',
              error: error,
              stackTrace: StackTrace.current,
            );
            return error.left();
          },
          ifRight: (_) => attempt.right(),
        );
      }
      );
  }

  List<QuizAttemptItemsModel> _buildAttemptItems({
    required String attemptId,
    required QuestionModel session,
  }) {
    final answers = session.userAnswers;

    return session.questions.map((q) {
      final answer = answers[q.flashcardId]?.trim().toLowerCase();
      final correct = q.correctAnswer.trim().toLowerCase();
      final isCorrect = answer != null && answer == correct;

      return QuizAttemptItemsModel(
        id: '',
        attemptId: attemptId,
        flashcardId: q.flashcardId,
        isCorrect: isCorrect,
      );
    }).toList();
  }

  int _calculateCorrectAnswers(QuestionModel session) {
    final answers = session.userAnswers;
    return session.questions.where((q) {
      final answer = answers[q.flashcardId]?.trim().toLowerCase();
      final correct = q.correctAnswer.trim().toLowerCase();
      return answer != null && answer == correct;
    }).length;
  }

  int _calculateScore(int correctAnswers, int totalQuestions) {
    if (totalQuestions == 0) return 0;
    return ((correctAnswers / totalQuestions) * 100).round();
  }

  // Future<QuizAttemptsModel> updateQuizAttemp({
  //   int? topicId,
  //   required int score,
  //   required int totalQuestions,
  //   required int correctAnswers,
  // }) async {
  //   final result = await _repo.updateQuizAttemp(
  //     userId: _currentUserId,
  //     topicId: topicId,
  //     score: score,
  //     totalQuestions: totalQuestions,
  //     correctAnswers: correctAnswers,
  //   );
  //   return result.fold(
  //     ifLeft: (error) {
  //       developer.log(
  //         'UserDailyWordService: Error fetching data',
  //         error: error,
  //         stackTrace: StackTrace.current,
  //       );
  //       throw error;
  //     },
  //     ifRight: (){},
  //   );
  // }
}
