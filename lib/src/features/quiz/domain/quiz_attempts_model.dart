import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_attempts_model.freezed.dart';

@freezed
abstract class QuizAttemptsModel with _$QuizAttemptsModel{
  const factory QuizAttemptsModel({
    required String id,

    required String userId,
    @Default(0) int? topicId,
    @Default('daily') String attemptType,
    @Default(0) int? score,
    required int totalQuestions,
    @Default(0) int? correctAnswers,

    DateTime? createdAt,

  }) = _QuizAttemptsModel;
}