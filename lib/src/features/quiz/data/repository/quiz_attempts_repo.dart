import 'package:app_demo/src/features/quiz/data/dto/quiz_attempts_dto.dart';
import 'package:app_demo/src/features/quiz/data/source/quiz_attempts_source.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizAttemptsRepoProvider = Provider(
  (ref) => QuizAttemptsRepo(ref.read(quizAttemptsSourceProvider)),
);

class QuizAttemptsRepo {
  final QuizAttemptsSource _source;
  QuizAttemptsRepo(this._source);

  Future<Either<AppException, QuizAttemptsModel>> insertQuizAttemp({
    required String userId,
    required int topicId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
  }) async {
    final result = await _source.insertQuizAttemp(
      userId: userId,
      topicId: topicId,
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
    );
    return result.map((dto) => dto.toDomain());
  }

  Future<Either<AppException, QuizAttemptsModel>> updateQuizAttemp({
    required String userId,
    int? topicId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
    required String id,
  }) async {
    final result = await _source.updateQuizAttemp(
      id: id,
      userId: userId,
      topicId: topicId,
      score: score,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
    );
    return result.map((dto) => dto.toDomain());
  }
}
